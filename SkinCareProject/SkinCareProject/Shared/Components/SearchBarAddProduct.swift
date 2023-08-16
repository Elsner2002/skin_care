//
//  SearchBarAddProduct.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 14/08/23.
//

import SwiftUI

struct SearchbarAddProduct: View {
    
    @StateObject private var cameraVM = CameraViewModel()
    @Binding var searchText: String
    @Binding var routine: Routine
    var showCreateProduct: Bool
    var addRoutine: Bool

    var body: some View {
        NavigationStack {
            ZStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.systemLabelTerciary)
                    TextField("Busque produtos", text: $searchText)
                        .foregroundColor(Color.brandGray)
                        .disableAutocorrection(true)
                        .overlay(
                            Image(systemName: "xmark.circle.fill")
                                .padding([.bottom, .leading, .top])
                                .offset(x: 10)
                                .foregroundColor(Color.brandGray)
                                .opacity(searchText.isEmpty ? 0.0 : 1.0)
                                .onTapGesture {
                                    UIApplication.shared.endEditing()
                                    searchText = ""
                                }
                            
                            ,alignment: .trailing
                        )
                    
                }
                .font(.headline)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brandWhite)
                        .shadow(
                            color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                        )
                )
                .padding()
                HStack{
                    Spacer()
                    NavigationLink {
                        CameraAddProductView(routine: $routine, showCreateProduct: showCreateProduct, addRoutine: addRoutine)
                            .environmentObject(cameraVM)
                            .task {
                                await cameraVM.requestDataScannerAccessStatus()
                            }
                    } label: {
                        Image("scanSymbol")
                            .padding(.trailing, 24)
                            .offset(x: 10)
                            .foregroundColor(Color.brandGray)
                    }

                }
                .padding()
                .opacity(searchText.isEmpty ? 1.0 : 0.0)
            }
        }
    }
}

struct SearchbarAddProduct_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarAddProduct(searchText: .constant(""), routine: .constant(Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])), showCreateProduct: false, addRoutine: true)
    }
}

