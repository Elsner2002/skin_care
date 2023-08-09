//
//  AddProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.dismiss) var dismiss
   
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .frame(width: 12, height: 24)
                        }
                        .foregroundColor(Color.black)
                    }
                    Spacer()
                    Text("Adicionar produto")
                        .font(Font.custom("SF Pro", size: 18))
                        .padding(.trailing, 16)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.leading, 20)
                
                Searchbar(searchText: $searchText)
                
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
                VerticalScrollProductsView()
            }
        }
    }
    
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
