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
    @State var showEdit: Bool = false
    @Binding var productList: [RoutineProduct]
    @Binding var routine: Routine
    
    var body: some View {
        
        NavigationStack {
            VStack (alignment: .leading, spacing: 10) {
                ListTitle(category: category, routine: $routine)
                    .environmentObject(vm)
                
                if productList.isEmpty {
                    ListDescription(description: description)
                }
                else {
                    ForEach($productList, id: \.self) { $product in
                        ListProductComponent(product: $product)
                            .contextMenu {
                                Button(role: .none) {
                                    showEdit.toggle()
                                } label: {
                                    Label("Editar", systemImage: "gearshape.fill")
                                        .tint(Color.systemMaterialSecondary)
                                }
                                Button(role: .destructive) {
                                    vm.deleteItem(publicDb: false, product: product)
                                    productList.removeAll(where: {$0.self == product})
                                } label: {
                                    Label("Deletar", systemImage: "trash.fill")
                                }
                            }
                            .fullScreenCover(isPresented: $showEdit){
                                CreateProductView(routine: $routine, ckName: product.name, ckBrand: product.brand, ckImage: product.image, ckCategory: product.categories[0], ckFrequency: product.frequency)
                            }
                    }
                    .padding(.leading, 3)
                    .padding(.trailing, 10)
                    .padding(.vertical, -2)
                }
            }
        }
        .padding()
    }
}


struct ListView_Previews: PreviewProvider {
    static let url: URL = CloudKitUtility.makeURLJPG(image: "gato-cinza")
    static let array: [RoutineProduct] = [RoutineProduct(image: url, name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza", "Tônicos & Tratamentos",  "Hidratante"], routine: "Rotina Diurna")!, RoutineProduct(image: url, name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza", "Tônicos & Tratamentos",  "Hidratante"], routine: "Rotina Diurna")!]
    
    static var previews: some View {
        ListView(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas", category: "Limpeza",  productList: .constant(array), routine: .constant(Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])))
    }
}
