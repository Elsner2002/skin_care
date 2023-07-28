//
//  CloudKitViewModel.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 28/07/23.
//

import SwiftUI
import Combine
import CloudKit

class CloudKitModel: ObservableObject {
    
    @Published var isSignedToiCloud: Bool = false
    @Published var permissionStatus: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    @Published var routineProducts: [RoutineProduct] = []
    var cancellables = Set<AnyCancellable>()
   
    init() {
        getiCloudStatus()
        requestPermission()
        getCurrentUserName()
    }
    
    //MARK: iCloud User
    
    private func getiCloudStatus() {
        CloudKitUtility.getiCloudStatus()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case  .failure(let error):
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] success in
                self?.isSignedToiCloud = success
            }
            .store(in: &cancellables)
    }
    
    func requestPermission() {
        CloudKitUtility.requestApplicationPermission()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            
            } receiveValue: { [weak self] success in
                self?.permissionStatus = success
            }
            .store(in: &cancellables)
    }
    
    func getCurrentUserName() {
        CloudKitUtility.discoverUserIdentity()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            
            } receiveValue: { [weak self] returnedName in
                self?.userName = returnedName
            }
            .store(in: &cancellables)
    }
    
    
    //MARK: CRUD
    
    //CREATE
    private func addItem(name: String){
        //images in cloudkit
        guard
            let image = UIImage(named: "strawberry"),
            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("strawberry.png"),
            let data = image.pngData() else {return}
        
        do {
            try data.write(to: url)
            guard let newProduct = RoutineProduct(image: url, name: "Test", isCompleted: false, barcode: 123, frequency: [1,2,3], timesDay: 1, categories: ["Cleanser"]) else {return}
            
            CloudKitUtility.add(item: newProduct) { result in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.routineProducts.append(newProduct)
                    //self.fetchItems()
                }
            }
        } catch let error{
            print(error)
        }
    }
    
    //READ
    func fetchItems() {
        let predicate = NSPredicate(value: true)
        let recordType = "RoutineProduct"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItem in
                self?.routineProducts = returnedItem
            }
            .store(in: &cancellables)
    }
    
    //UPDATE
     func updateItem(routineProduct: RoutineProduct) {
         guard let newProduct = routineProduct.updateName(newName: "new name") else {return}
         CloudKitUtility.update(item: newProduct) {[weak self] result in
             print("update was successfull")
             self?.fetchItems()
         }
    }
    
    //DELETE
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let product = routineProducts[index]
        let record = product.record
        
        CloudKitUtility.delete(item: product)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                self?.routineProducts.remove(at: index)
            }
            .store(in: &cancellables)
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { retunedRecordId, returnedError in
            DispatchQueue.main.async {
                self.routineProducts.remove(at: index)
            }
        }
    }
    
}

struct CloudKitViewModel: View {
    @StateObject private var vm = CloudKitModel()

    var body: some View {
        VStack {
            Text("CloudKit View Model")
            Text("is signed in: \(vm.isSignedToiCloud.description)")
            Text("Name: \(vm.userName)")
        }    }
}

struct CloudKitViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitViewModel()
    }
}
