//
//  CameraView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 25/07/23.
//

import SwiftUI

struct CameraView: View {
    @StateObject private var vm = CloudKitModel()

    @EnvironmentObject var cameraVM: CameraViewModel
    @State var isProductViewShowing: Bool = false
    @State var barcodeId: Int = 0
    
    var body: some View {
        
        ZStack {
            switch cameraVM.dataSannerAccessStatus{
            case . scannerAvailable:
                mainView
                
            case .cameraNotAvailable:
                Text("Your device doesn't have a camera")
                
            case .scannerNotAvailable:
                Text("Your device doesn't have support for scanning")
                
            case .cameraAccessNotGaranted:
                Text("Please provide access to camera in settings")
                
            case .notDetermined:
                Text("Request camera access")
            }
            
            Image("BarcodeReader").resizable()
        }
    }
    
    private var mainView: some View {
        VStack{
            if let productFound = vm.getProductBarcode(barcode: barcodeId) {
                NavigationLink("", destination: ProductView(product: productFound), isActive: $isProductViewShowing)
            }
            else {
                //mostrar popUp que o produto nao existe
            }
            DataScannerView(recognizedItems: $cameraVM.recognizedItems)
                .onChange(of: cameraVM.recognizedItems) { newValue in
                    for nv in newValue {
                        switch nv {
                        case .barcode(let barcode):
                            if let barcodeString = barcode.payloadStringValue {
                                if let barcodeId = Int(barcodeString) {
                                    self.barcodeId = barcodeId
                                    self.isProductViewShowing = true
                                }
                            }
                        case .text(_):
                            break
                        @unknown default:
                            break
                        }
                    }
                }
        }
    }
}
