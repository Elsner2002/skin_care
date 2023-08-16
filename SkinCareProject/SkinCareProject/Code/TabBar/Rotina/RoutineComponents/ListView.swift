//
//  ListView.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI
import Combine
import CloudKit

struct ListView: View {
    
    let description: String
    let category: String
    @EnvironmentObject var vm: CloudKitModel

    @Binding var productList: [RoutineProduct]
    @Binding var routine: Routine
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 10) {
                ListTitle(category: category, routine: $routine)
                
                if productList.isEmpty {
                    ListDescription(description: description)
                }
                else {
                    List {
                        Section{
                            ForEach($productList, id: \.self) { $product in
                                ListProductComponent(product: product)
                                    .swipeActions (allowsFullSwipe: false) {
                                        Button(role: .destructive) {
                                            vm.deleteItem(publicDb: false, product: product)
                                        } label: {
                                            Label("Delete", systemImage: "trash.fill")
                                        }
                                        .tint(Color.red)
                                        Button {
                                            CreateProductView(routine: $routine)
                                        } label: {
                                            Image (systemName: "gearshape.fill")
                                        }
                                        .tint(Color.systemMaterial)
                                    }
                            }
                        }
                    }
                    .padding(.leading, 3)
                    .padding(.trailing, 10)
                    .padding(.vertical, 10)
                }
            } .padding()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static let url: URL = CloudKitUtility.makeURLJPG(image: "gato-cinza")
    static let array: [RoutineProduct] = [RoutineProduct(image: url, name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza", "Tônicos & Tratamentos",  "Hidratante"])!, RoutineProduct(image: url, name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza", "Tônicos & Tratamentos",  "Hidratante"])!]
    
    static var previews: some View {
        ListView(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas", category: "Limpeza",  productList: .constant(array), routine: .constant(Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])))
    }
}
