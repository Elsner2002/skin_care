//
//  AddProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct AddProductView: View {
    
    @StateObject private var cameraVM = CameraViewModel()
    
    @State private var searchText = ""
    
    @State var listTest: [(String, String, String, Int)] = [("A", "a", "ProfileDefault", 10), ("B", "b", "ProfileDefault", 100), ("C", "c", "ProfileDefault", 50), ("D", "d", "ProfileDefault", 70), ("E", "e", "ProfileDefault", 1000), ("A", "a", "ProfileDefault", 10), ("B", "b", "ProfileDefault", 100), ("C", "c", "ProfileDefault", 50), ("D", "d", "ProfileDefault", 70), ("E", "e", "ProfileDefault", 1000)]
    
    var body: some View {
        VStack{
            ZStack{
                Searchbar(searchText: $searchText, textPlaceHolder: "Busque produtos")
                HStack{
                    Spacer()
                    Image("scanSymbol")
                        .padding(.trailing, 24)
                        .offset(x: 10)
                        .foregroundColor(Color.brandGray)
                }
                .padding()
                .opacity(searchText.isEmpty ? 1.0 : 0.0)
            }
            
            NavigationLink {
                CreateProductView()
            } label: {
                Text("Adicionar produto manualmente")
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.systemMaterial)
                    .foregroundColor(Color.systemLabelPrimary)
                    .cornerRadius(10, corners: .allCorners)
            }
            
            ScrollView(showsIndicators: false) {
                ForEach(0..<listTest.count) { position in
                    Button {
                        //
                    } label: {
                        ButtonProductList(name: listTest[position].0, brand: listTest[position].1, price: listTest[position].3, image: Image(listTest[position].2))
                    }
                    
                }
            }
        }
        .navigationTitle("Adicionar Produtos")
    }
    
}

//struct AddProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProductView()
//    }
//}
