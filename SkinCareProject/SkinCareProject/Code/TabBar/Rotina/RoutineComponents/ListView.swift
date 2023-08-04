//
//  ListView.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI
import Combine
import CloudKit

class ListModel: ObservableObject {
    @Published var list: [RoutineProduct] = []
    var cancellables = Set<AnyCancellable>()

    init(list: [RoutineProduct]) {
        self.list = list
    }

    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let product = list[index]
        let record = product.record

        CloudKitUtility.delete(item: product)
            .receive(on: DispatchQueue.main)
            .sink { _ in

            } receiveValue: { [weak self] success in
                self?.list.remove(at: index)
            }
            .store(in: &cancellables)

        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { retunedRecordId, returnedError in
            DispatchQueue.main.async {
                self.list.remove(at: index)
            }
        }
    }
} //delete? if logic doesnt work

struct ListView: View {
    
    let description: String
    let category: String
    let routine: Routine
    @State var list: [RoutineProduct]
    
    init(description: String, category: String, routine: Routine) {
        self.description = description
        self.category = category
        self.routine = routine
        self.list = routine.categoryLimpeza //how to get routine category?
    }
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let product = list[index]
        let record = product.record
        
        CloudKitUtility.delete(item: product)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { success in
                list.remove(at: index)
            }
        // .store(in: &cancellables)
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { retunedRecordId, returnedError in
            DispatchQueue.main.async {
                list.remove(at: index)
            }
        }
    }
    
    var body: some View {
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
                        } .onDelete(perform: deleteItem)
                    } header: {
                        ListTitle(category: category)
                    }
                }
                .padding(.leading, 3)
                .padding(.trailing, 10)
                .padding(.vertical, 10)
            }
        } .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static let url: URL = CloudKitUtility.makeURLJPG(image: "gato-cinza")
    static let array: [RoutineProduct] = [RoutineProduct(image: url, name: "test", isCompleted: false, barcode: 12345, frequency: [1], timesDay: 1, categories: ["Limpeza", "Tônicos & Tratamentos",  "Hidratante"])!, RoutineProduct(image: url, name: "test", isCompleted: false, barcode: 12345, frequency: [1], timesDay: 1, categories: ["Limpeza", "Tônicos & Tratamentos",  "Hidratante"])!]
    
    static var previews: some View {
        ListView(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas", category: "Limpeza",  routine: Routine(name: "Noite", completition: 0, categoryLimpeza: array, categoryTratamentos: [], categoryHidratante: [], categoryProtetor: []) )
    }
}
