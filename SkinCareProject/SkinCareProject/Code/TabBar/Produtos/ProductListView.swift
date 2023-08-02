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
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                HStack{
                    //searchBar
                    Button {
                        path.append(1)
                    } label: {
                        Image("scanSymbol")
                            .resizable()
                            .scaledToFit()
                    }
                    .navigationDestination(for: Int.self) { int in
                        CameraView(path: $path, count: int)
                            .environmentObject(cameraVM)
                            .task {
                                await cameraVM.requestDataScannerAccessStatus()
                            }
                    }
                }
                
                Text("Recomendados para seu tipo de pele")
                HStack{
                    //productButton
                }
                
                HStack{
                    Text("Conheça Mais")
                    Button {
                        //AllProductsListView
                    } label: {
                        Text("Ver Todos")
                    }

                }
                HStack{
                    //productButton
                }
                
                Text("Dica do Dia")
                TipsView(title: Constants.shared.randomTip!.title, text: Constants.shared.randomTip!.text)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
