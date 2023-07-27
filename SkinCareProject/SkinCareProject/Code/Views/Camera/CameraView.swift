//
//  CameraView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 25/07/23.
//

import SwiftUI

struct CameraView: View {
    
    @EnvironmentObject var cameraVM: CameraViewModel
    @State var isProductViewShowing: Bool = false
    @State var barcodeString: String = ""
    
    @Binding var path: [Int]
    let count: Int
    
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
            
            Image("Leitor codigo de barras").resizable()
        }
    }
    
    private var mainView: some View {
        VStack{
            NavigationLink("", destination: ProductView(path: $path, count: count + 1, barcode: barcodeString), isActive: $isProductViewShowing)
            DataScannerView(recognizedItems: $cameraVM.recognizedItems)
                .onChange(of: cameraVM.recognizedItems) { newValue in
                    for nv in newValue {
                        switch nv {
                        case .barcode(let barcode):
                            if let barcodeString = barcode.payloadStringValue {
                                if (Int(barcodeString) != nil) {
                                    self.barcodeString = barcodeString
                                    self.path.append(count + 1)
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

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
