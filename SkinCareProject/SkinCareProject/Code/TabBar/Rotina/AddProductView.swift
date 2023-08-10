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
            ZStack {
                Color.brandGreen.ignoresSafeArea()
                Rectangle()
                    .frame(width: .infinity, height: 400)
                    .offset(y: 350)
                    .ignoresSafeArea()
                    .foregroundColor(Color.systemBG)
                VStack{
                    HStack (alignment: .center){
                        Button {
                            dismiss()
                        } label: {
                            HStack{
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .frame(width: 12.5, height: 22)
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
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                    
                    VStack {
                        Searchbar(searchText: $searchText)
                            .padding(.bottom, -20)
                            .padding(.top, 20)
                        
                        NavigationLink {
                            CreateProductView()
                        } label: {
                            Text("Adicionar produto manualmente")
                                .bold()
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                                .background(Color.systemMaterialSecondary)
                                .foregroundColor(Color.systemLabelSecondary)
                                .cornerRadius(10, corners: .allCorners)
                        }
                        .padding()
                        VerticalScrollProductsView(searchText: searchText)
                        Spacer()
                    }
                    .background(Color.systemBG)
                    .cornerRadius(40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
