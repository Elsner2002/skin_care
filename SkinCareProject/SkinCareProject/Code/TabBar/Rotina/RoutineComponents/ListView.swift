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
    let routine: Routine
    @StateObject private var vm = CloudKitModel()
    @State var list: [RoutineProduct]
    
    
    init(description: String, category: String, routine: Routine) {
        self.description = description
        self.category = category
        self.routine = routine
        self.list = routine.categoryLimpeza //how to get routine category?
    }
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 10) {
                ListTitle(category: category)
                
                if list.isEmpty {
                    ListDescription(description: description)
                }
                else {
                    List {
                        Section{
                            ForEach(list, id: \.self) { product in
                                ListProductComponent(product: product)
                                    .swipeActions (allowsFullSwipe: false) {
                                        Button(role: .destructive) {
                                            //delete item v.delete
                                        } label: {
                                            Label("Delete", systemImage: "trash.fill")
                                        }
                                        .tint(Color.red)
                                        Button {
                                            CreateProductView()
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
        ListView(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas", category: "Limpeza",  routine: Routine(name: "Noite", completition: 0, categoryLimpeza: array, categoryTratamentos: [], categoryHidratante: [], categoryProtetor: []) )
    }
}
