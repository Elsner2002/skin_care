//
//  CloudKitViewModel.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 28/07/23.
//

import SwiftUI
import Combine
import CloudKit

class UserInfo: ObservableObject {
    @Published var userVegan: Bool = false {
        didSet {
            print(userVegan)
        }
    }
    @Published var userPhototype: String = "NaoAlterado"{
        didSet {
            print(userPhototype)
        }
    }
    @Published var userSkinType: String = "NaoAlterado"{
        didSet {
            print(userSkinType)
        }
    }
    @Published var userConditions: [String] = []{
        didSet {
            print(userConditions)
        }
    }
    @Published var userImage: URL = CloudKitUtility.makeURLJPG(image: "ProfileDefault"){
        didSet {
            print(userImage)
        }
    }
    @Published var userAge: Int = -1{
        didSet {
            print(userAge)
        }
    }
    @Published var userGender: String = "NaoAlterado"{
        didSet {
            print(userGender)
        }
    }
    @Published var userLocation: String = "NaoAlterado"{
        didSet {
            print(userLocation)
        }
    }
}

class CloudKitModel: ObservableObject {
    
    @Published var isSignedToiCloud: Bool = false
    @Published var permissionStatus: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    @Published var routineProducts: [RoutineProduct] = []
    @Published var listProducts: [ListProduct] = []
    @Published var diaryList: [Diary] = []
    @Published var tips: [Tip] = []
    @Published var dailyTip: [Tip] = []
    @Published var user: [User] = []
    @Published var ingredients: [Ingredient] = []
    @State var isLoading: Bool = true
    
    @Published var defaultUser: User = User(profileImage: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), vegan: false, phototype: Phototype.one.title, skinType: SkinType.oily.rawValue, conditions: [Condition.none.rawValue], concerns: [Concern.none.rawValue], gender: Gender.female.rawValue, age: 18, location: Location.dry.rawValue)!
    //set each variable in the questionnaire
     let product: RoutineProduct = RoutineProduct(image: CloudKitUtility.makeURLJPG(image: "gato-cinza"), name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza"], routine: "Rotina Diurna")!
    
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getiCloudStatus()
        requestPermission()
        getCurrentUserName()
        loadAll() {
            self.isLoading = false
        }
    }
    
    func addButtonPressed() {
        addIngredient(publicDb: true, name: "test ingredient", recordType: CloudKitUtility.CloudKitTypes.Ingredient, newIngredient: Ingredient(names: ["Aqua", "Água"], description: "water")!)
    }
    
    func getProductBarcode(barcode: Int) -> ListProduct?{
        var productBarcode: ListProduct?
        self.listProducts.forEach { product in
            if product.barcode == barcode {
                productBarcode = product
            }
        }
        return productBarcode
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
    
    func loadAll(completion: () -> Void) {
        self.isLoading = true
        fetchItems(publicDb: true, recordType: CloudKitUtility.CloudKitTypes.ListProduct)//, limit: 10)
        fetchItems(publicDb: false, recordType: CloudKitUtility.CloudKitTypes.RoutineProduct)
        fetchItems(publicDb: false, recordType: CloudKitUtility.CloudKitTypes.User)
        fetchItems(publicDb: false, recordType: CloudKitUtility.CloudKitTypes.Diary)
        fetchItems(publicDb: true, recordType: CloudKitUtility.CloudKitTypes.Ingredient)

        completion()
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
    func addUser(publicDb: Bool, name: String, recordType: CloudKitUtility.CloudKitTypes){
        CloudKitUtility.add(publicDb: publicDb, item: defaultUser) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.fetchItems(publicDb: publicDb, recordType: recordType)
            }
        }
    }
    
    func addProduct(publicDb: Bool, name: String, recordType: CloudKitUtility.CloudKitTypes, newProduct: RoutineProduct){
        CloudKitUtility.add(publicDb: publicDb, item: newProduct) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.routineProducts.append(newProduct)
                self.fetchItems(publicDb: publicDb, recordType: recordType)
            }
        }
    }
    
    private func addDiary(publicDb: Bool, name: String, recordType: CloudKitUtility.CloudKitTypes, newDiary: Diary){
        CloudKitUtility.add(publicDb: publicDb, item: newDiary) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.diaryList.append(newDiary)
                self.fetchItems(publicDb: publicDb, recordType: recordType)
            }
        }
    }
    
    private func addIngredient(publicDb: Bool, name: String, recordType: CloudKitUtility.CloudKitTypes, newIngredient: Ingredient){
        CloudKitUtility.add(publicDb: publicDb, item: newIngredient) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.ingredients.append(newIngredient)
                self.fetchItems(publicDb: publicDb, recordType: recordType)
            }
        }
    }

    
    //READ
    func fetchItems(publicDb: Bool, recordType: CloudKitUtility.CloudKitTypes, limit: Int? = nil) {
        let predicate = NSPredicate(value: true)
        let cloudType = recordType
        let recordType = recordType.rawValue
        
        switch cloudType {
        case .ListProduct:
            CloudKitUtility.fetch(publicDb: publicDb, predicate: predicate, recordType: recordType, resultsLimit: limit)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    
                } receiveValue: { [weak self] returnedItem in
                    self?.listProducts = returnedItem
                }
                .store(in: &cancellables)
        case .RoutineProduct:
            CloudKitUtility.fetch(publicDb: publicDb, predicate: predicate, recordType: recordType)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    
                } receiveValue: { [weak self] returnedItem in
                    self?.routineProducts = returnedItem
                }
                .store(in: &cancellables)
        case .User:
              CloudKitUtility.fetch(publicDb: publicDb, predicate: predicate, recordType: recordType)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    
                } receiveValue: { [weak self] returnedItem in
                    self?.user = returnedItem
                }
                .store(in: &cancellables)
        case .Diary:
            CloudKitUtility.fetch(publicDb: publicDb, predicate: predicate, recordType: recordType)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    
                } receiveValue: { [weak self] returnedItem in
                    self?.diaryList = returnedItem
                }
                .store(in: &cancellables)
        case .Ingredient:
            CloudKitUtility.fetch(publicDb: publicDb, predicate: predicate, recordType: recordType)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    
                } receiveValue: { [weak self] returnedItem in
                    self?.ingredients = returnedItem
                }
                .store(in: &cancellables)
        }
    }
    
    //UPDATE
    func updateItem(publicDb: Bool, routineProduct: RoutineProduct, recordType: CloudKitUtility.CloudKitTypes, productName: String = "NaoAlterado", productBrand: String = "NaoAlterado", frequency: [Int] = [], categories: [String] = [], productImage: URL = CloudKitUtility.makeURLJPG(image: "ProfileDefault")) {
        var newProduct = routineProduct
        if productName != "NaoAlterado" {
            newProduct = newProduct.updateName(newName: productName)!
        }
        if productBrand != "NaoAlterado" {
            newProduct = newProduct.updateBrand(newBrand: productBrand)!
        }
        if !frequency.isEmpty {
            newProduct = newProduct.updateFrequency(newFrequency: frequency)!
        }
        if !categories.isEmpty {
            newProduct = newProduct.updateCategories(newCategories: categories)!
        }
        if productImage != CloudKitUtility.makeURLJPG(image: "ProfileDefault"){
            newProduct = newProduct.updateImage(newImage: productImage)!
        }
        CloudKitUtility.update(publicDb: publicDb, item: newProduct) {[weak self] result in
            print("update was successfull")
            self?.fetchItems(publicDb: publicDb, recordType: recordType)
        }
    }
    
    func updateItemCheck(publicDb: Bool, routineProduct: RoutineProduct, recordType: CloudKitUtility.CloudKitTypes, completition: Bool) {
        guard let newProduct = routineProduct.updateIsCompleted(newCompletion: completition) else {return}
        CloudKitUtility.update(publicDb: publicDb, item: newProduct) {[weak self] result in
            print("update was successfull")
            self?.fetchItems(publicDb: publicDb, recordType: recordType)
        }
    }
    
    func NEW_updateUser(publicDb: Bool, appUser: User, recordType: CloudKitUtility.CloudKitTypes, userInfo: UserInfo) {
        var newUser = appUser
        if userInfo.userVegan != appUser.vegan {
            newUser = newUser.updateVegan(newVegan: userInfo.userVegan)!
        }
        if userInfo.userPhototype != "NaoAlterado" {
            newUser = newUser.updatePhototype(newPhototype: userInfo.userPhototype)!
        }
        if userInfo.userSkinType != "NaoAlterado" {
            newUser = newUser.updateSkinType(newSkinType: userInfo.userSkinType)!
        }
        if !userInfo.userConditions.isEmpty {
            newUser = newUser.updateConditions(newConditions: userInfo.userConditions)!
        }
        if userInfo.userImage != CloudKitUtility.makeURLJPG(image: "ProfileDefault"){
            newUser = newUser.updateImage(newImage: userInfo.userImage)!
        }
        CloudKitUtility.update(publicDb: publicDb, item: newUser) {[weak self] result in
            print("update was successfull")
            self?.fetchItems(publicDb: publicDb, recordType: recordType)
        }
    }
    
    func updateUser(publicDb: Bool, appUser: User, recordType: CloudKitUtility.CloudKitTypes, userVegan: Bool, userPhototype: String = "NaoAlterado", userSkinType: String = "NaoAlterado", userConditions: [String] = [], userImage: URL = CloudKitUtility.makeURLJPG(image: "ProfileDefault"), userGender: String = "NaoAlterado", userAge: Int = 0, userLocation: String = "NaoAlterado") {
        var newUser = appUser
        if userVegan != appUser.vegan {
            newUser = newUser.updateVegan(newVegan: userVegan)!
        }
        if userPhototype != "NaoAlterado" {
            newUser = newUser.updatePhototype(newPhototype: userPhototype)!
        }
        if userSkinType != "NaoAlterado" {
            newUser = newUser.updateSkinType(newSkinType: userSkinType)!
        }
        if !userConditions.isEmpty {
            newUser = newUser.updateConditions(newConditions: userConditions)!
        }
        if userImage != CloudKitUtility.makeURLJPG(image: "ProfileDefault"){
            newUser = newUser.updateImage(newImage: userImage)!
        }
        if userGender != "NaoAlterado" {
            newUser = newUser.updateGender(newGender: userGender)!
        }
        if userAge != 0 {
            newUser = newUser.updateAge(newAge: userAge)!
        }
        if userGender != "NaoAlterado" {
            newUser = newUser.updateLocation(newLocation: userLocation)!
        }
        
        CloudKitUtility.update(publicDb: publicDb, item: newUser) {[weak self] result in
            print("update was successfull")
            self?.fetchItems(publicDb: publicDb, recordType: recordType)
        }
    }
    
    func updateDiary(publicDb: Bool, diary: Diary, recordType: CloudKitUtility.CloudKitTypes, diaryDayCompletion: Int = 100, diaryNightCompletion: Int = 100, diaryNotes: String = "NaoAlterado", diaryImage: URL = CloudKitUtility.makeURLJPG(image: "ProfileDefault")) {
        var newDiary = diary
        
        if diaryDayCompletion != 100 {
            newDiary = newDiary.updateDayCompletion(newDayCompletion: diaryDayCompletion)!
        }
        if diaryNightCompletion != 100 {
            newDiary = newDiary.updateNightCompletion(newNightCompletion: diaryNightCompletion)!
        }
        if diaryNotes != "NaoAlterado" {
            newDiary = newDiary.updateNotes(newNotes: diaryNotes)!
        }
        if diaryImage != CloudKitUtility.makeURLJPG(image: "ProfileDefault"){
            newDiary = newDiary.updateImage(newImage: diaryImage)!
        }
        CloudKitUtility.update(publicDb: publicDb, item: newDiary) {[weak self] result in
            print("update was successfull")
            self?.fetchItems(publicDb: publicDb, recordType: recordType)
        }
    }
    
    //DELETE
    func deleteItem(publicDb: Bool, product: RoutineProduct) {
        //guard let index = indexSet.first else {return}
       // let product = routineProducts[index]
        let record = product.record
        
        CloudKitUtility.delete(publicDb: publicDb, item: product)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                self?.routineProducts.removeAll(where: { $0.record == record })
            }
            .store(in: &cancellables)
        
        CKContainer.default().privateCloudDatabase.delete(withRecordID: record.recordID) { retunedRecordId, returnedError in
            DispatchQueue.main.async {
                self.routineProducts.removeAll(where: { $0.record == record })
            }
        }
    }
    
    func deleteDiary(publicDb: Bool, indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let diary = diaryList[index]
        let record = product.record
        
        CloudKitUtility.delete(publicDb: publicDb, item: product)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                self?.diaryList.remove(at: index)
            }
            .store(in: &cancellables)
        
        CKContainer.default().privateCloudDatabase.delete(withRecordID: record.recordID) { retunedRecordId, returnedError in
            DispatchQueue.main.async {
                self.diaryList.remove(at: index)
            }
        }
    }
    
    func deleteUser(publicDb: Bool) {
        let user = user[0]
        let record = user.record
        
        CloudKitUtility.delete(publicDb: publicDb, item: product)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                self?.user.remove(at: 0)
            }
            .store(in: &cancellables)
        
        CKContainer.default().privateCloudDatabase.delete(withRecordID: record.recordID) { retunedRecordId, returnedError in
            DispatchQueue.main.async {
                self.user.remove(at: 0)
            }
        }
    }
}

struct CloudKitViewModel: View {
    @StateObject private var vm = CloudKitModel()
    
    
    @State var product: RoutineProduct = RoutineProduct(image: nil, name: "teste", brand: "test", isCompleted: false, barcode: 123, frequency: [1], categories: ["teste"], routine: "Rotina Diurna")!
    
    var body: some View {
        VStack {
            Text("CloudKit View Model")
            Text("is signed in: \(vm.isSignedToiCloud.description)")
            Text("Name: \(vm.userName)")
            
//            Button {
//                vm.requestNotificationPermissions()
//            } label: {
//                Text("Notification Permission")
//                    .font(.headline)
//            }
//            
//            Button {
//                vm.subscribeToNotifications()
//            } label: {
//                Text("Fire Notif.")
//                    .font(.headline)
//            }
            
            //ListProductComponent(product: product)
        }
//        .onChange(of: self.vm.routineProducts, perform: { _ in
//            self.product = vm.routineProducts[0]
//        })
    }
}

struct CloudKitViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitViewModel()
    }
}
