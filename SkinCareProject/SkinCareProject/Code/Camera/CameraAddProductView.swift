//
//  CameraView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 25/07/23.
//

import SwiftUI

struct CameraAddProductView: View {
    @StateObject var vm = CloudKitModel()

    @EnvironmentObject var cameraVM: CameraViewModel
    @State var isProductViewShowing: Bool = false
    @State var productNotFound: Bool = false
    @State var barcodeId: Int = 0
    @State var product: ListProduct?
    @Binding var routine: Routine
    var showCreateProduct: Bool
    var addRoutine: Bool
//    @State var isLoading: Bool = false
    
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
            NavigationLink("", destination: ProductView(product: product, addRoutine: addRoutine), isActive: $isProductViewShowing)
            
            NavigationLink("", destination: ProductNotFoundAdd(routine: $routine, showCreateProduct: showCreateProduct), isActive: $productNotFound)
            
            DataScannerView(recognizedItems: $cameraVM.recognizedItems)
                .onChange(of: cameraVM.recognizedItems) { newValue in
//                    self.isLoading = true
                    for nv in newValue {
                        switch nv {
                        case .barcode(let barcode):
                            if let barcodeString = barcode.payloadStringValue {
                                if let barcodeId = Int(barcodeString) {
                                    self.barcodeId = barcodeId
                                    if let productFound = vm.getProductBarcode(barcode: barcodeId) {
                                        self.product = productFound
                                        self.isProductViewShowing = true
                                    }
                                    else {
                                        self.productNotFound = true
                                    }
                                }
                            }
//                            self.isLoading = false
                        case .text(_):
//                            self.isLoading = false
                            break
                        @unknown default:
//                            self.isLoading = false
                            break
                        }
                    }
                }
        }
//        .overlay {
//            if isLoading {
//                Text("Loading...")
//            }
//        }
    }
}
