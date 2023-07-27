//
//  ProductListView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var cameraVM = CameraViewModel()
    @State private var path: [Int] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                Text("Products")
                
                Button("Camera") {
                    path.append(1)
                }
                .navigationDestination(for: Int.self) { int in
                    CameraView(path: $path, count: int)
                        .environmentObject(cameraVM)
                        .task {
                            await cameraVM.requestDataScannerAccessStatus()
                        }
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
