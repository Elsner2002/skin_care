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
    @State var categoryButtons: [(ProductCategory, Bool)] = [
            (.moisturizer, false),
            (.cleanser, false),
            (.sunscreen, false),
            (.treatment, false)
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                Text("Lista de Produtos")
                    .bold()
                ZStack{
                    Searchbar(searchText: $searchText, textPlaceHolder: "Busque produtos")
                    HStack{
                        Spacer()
                        Button {
                            path.append(1)
                        } label: {
                            Image("scanSymbol")
                                .padding(.trailing, 24)
                                .offset(x: 10)
                                .foregroundColor(Color.brandGray)
                        }
                        .navigationDestination(for: Int.self) { int in
                            CameraView(path: $path, count: int)
                                .environmentObject(cameraVM)
                                .task {
                                    await cameraVM.requestDataScannerAccessStatus()
                                }
                        }
                    }
                    .padding()
                    .opacity(searchText.isEmpty ? 1.0 : 0.0)
                }
                ScrollView(showsIndicators: false) {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0..<categoryButtons.count) { position in
                                CategoryButton(
                                    selectedButton: categoryButtons[position].1,
                                    image: Image("ProfileDefault"),
                                    label: categoryButtons[position].0.rawValue)
                            }
                            .padding(.trailing)
                        }
                        .padding()
                    }
                    .padding([.leading, .trailing], 15)
                    
                    HStack{
                        Text("Recomendados para seu tipo de pele")
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 15)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ProductButton(image: Image("ProfileDefault"), brand: "AAAAA", name: "aaaaaa")
                        }
                        .padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.brandWhite)
                            .shadow(
                                color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                            )
                    )
                    .padding([.leading, .trailing], 15)
                    
                    HStack{
                        Text("Conheça Mais")
                            .bold()
                        Spacer()
                        Button {
                            //AllProductsListView
                        } label: {
                            Text("Ver Todos")
                                .foregroundColor(Color.brandGreen)
                        }

                    }
                    .padding([.leading, .trailing], 15)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ProductButton(image: Image("ProfileDefault"), brand: "AAAAA", name: "aaaaaa")
                        }
                        .padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.brandWhite)
                            .shadow(
                                color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                            )
                    )
                    .padding([.leading, .trailing], 15)
                    
                    HStack{
                        Text("Dica do Dia")
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 15)
                    TipsView(tip: Constants.shared.randomTip!)
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
