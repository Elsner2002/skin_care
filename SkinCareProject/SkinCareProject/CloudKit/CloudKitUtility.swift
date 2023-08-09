//
//  CloudKitUtility.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 27/07/23.
//

import Foundation
import CloudKit
import Combine
import UIKit

protocol CloudKitProtocol {
    init?(record: CKRecord)
    var record: CKRecord {get}
}

class CloudKitUtility {
    
    enum CloudKitError: LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
        case iCloudApplicationPermissionNotGranted
        case iCloudCouldNotfetchUserRecordID
        case iCloudCouldNotDiscoverUser
    }
    
    enum CloudKitTypes: String {
        case ListProduct = "ListProduct"
        case RoutineProduct = "RoutineProduct"
        case AppUser = "AppUser"
        case Tips = "Tips"
        case Diary = "Diary"
    }
    
}

//MARK: iCloud User Functions
extension CloudKitUtility {
    
    //iCloud Status
    static private func getiCloudStatus(completion: @escaping (Result<Bool, Error>) -> ()) {
        CKContainer.default().accountStatus {returnedStatus, returnedError in
            switch returnedStatus {
            case .available:
                completion(.success(true))
                break
            case  .noAccount:
                completion(.failure(CloudKitError.iCloudAccountNotFound))
            case .couldNotDetermine:
                completion(.failure(CloudKitError.iCloudAccountNotDetermined))
            case .restricted:
                completion(.failure(CloudKitError.iCloudAccountRestricted))
            default:
                completion(.failure(CloudKitError.iCloudAccountUnknown))
            }
        }
    }
    
    static func getiCloudStatus() -> Future<Bool, Error> {
        Future { promise in
            CloudKitUtility.getiCloudStatus { result in
                promise(result)
            }
        }
    }
    
    
    //Permission to use iCloud
    static private func requestApplicationPermission(completion: @escaping (Result<Bool, Error>) -> ()) {
        CKContainer.default().requestApplicationPermission([.userDiscoverability ]) { returnedStatus, returnedError in
            if returnedStatus == .granted {
                completion(.success(true))
            } else {
                completion(.failure(CloudKitError.iCloudApplicationPermissionNotGranted))
            }
        }
    }
    
    static func requestApplicationPermission() -> Future<Bool, Error> {
        Future { promise in
            CloudKitUtility.requestApplicationPermission() { result in
                promise(result)
            }
        }
    }
    
    
    //User Identity -> name
    static private func fetchiCloudUserRecordID(completion: @escaping (Result<CKRecord.ID, Error>) -> ()) {
        CKContainer.default().fetchUserRecordID { returnedID, returnedError in
            if let id = returnedID {
                completion(.success(id))
            } else {
                completion(.failure(CloudKitError.iCloudCouldNotfetchUserRecordID))
            }
        }
    }
    
    static private func discoveriCloudUser(id: CKRecord.ID, completion: @escaping (Result<String, Error>) -> ()) {
        CKContainer.default().discoverUserIdentity( withUserRecordID: id) { returnedIdentity, returnedError in
            if let name = returnedIdentity?.nameComponents?.givenName {
                //returnedIdentity.data we want (age, etc)
                completion(.success(name))
            } else {
                completion(.failure(CloudKitError.iCloudCouldNotDiscoverUser))
            }
        }
    }
    
    static private func discoverUserIdentity(completion: @escaping (Result<String, Error>) -> ()) {
        fetchiCloudUserRecordID { fetchCompletion in
            switch fetchCompletion {
            case .success(let recordId):
                CloudKitUtility.discoveriCloudUser(id: recordId, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func discoverUserIdentity() -> Future<String, Error> {
        Future { promise in
            CloudKitUtility.discoverUserIdentity() { result in
                promise(result)
            }
        }
    }
    
}

//MARK: CRUD Functions
extension CloudKitUtility {
    
    static func fetch<Type: CloudKitProtocol>(publicDb: Bool, predicate: NSPredicate, recordType: CKRecord.RecordType, sortDescription: [NSSortDescriptor]? = nil, resultsLimit: Int? = nil) -> Future<[Type], Error> {
        Future { promise in
            CloudKitUtility.fetch(publicDb: publicDb, predicate: predicate, recordType: recordType, sortDescription: sortDescription, resultsLimit: resultsLimit) { (items: [Type]) in
                promise(.success(items))
            }
        }
    }
    
    static private func fetch<Type: CloudKitProtocol>(publicDb: Bool, predicate: NSPredicate, recordType: CKRecord.RecordType, sortDescription: [NSSortDescriptor]? = nil, resultsLimit: Int? = nil, completion: @escaping (_ items: [Type]) -> ()) {
       
        //Create Operation
        let operation = createOperation(predicate: predicate, recordType: recordType, sortDescription: sortDescription,  resultsLimit: resultsLimit)
        
        //Get items in the query
        var returnedItems: [Type] = []
        addRecordMatchedBlock(operation: operation) { item in
            returnedItems.append(item)
        }
        
        //Query Completion
        addQueryResultBlock(operation: operation) { finished in
            completion(returnedItems)
        }
        
        //Execute operation
        addOperation(publicDb: publicDb, operation: operation)
    }
    
    //change the way of sorting the products
    static private func createOperation(predicate: NSPredicate, recordType: CKRecord.RecordType, sortDescription: [NSSortDescriptor]? = nil, resultsLimit: Int? = nil) -> CKQueryOperation {
        
        //let predicate = NSPredicate(format: "name = %@", argumentArray: ["lemon"])
        let query = CKQuery(recordType: recordType, predicate: predicate)
        
        //query and how to sort it (ex: alphabetical order): query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        query.sortDescriptors = sortDescription
        
        //queryoperation. resultslimit, other ways to show certains fruits, limit: 100
        let queryOperation = CKQueryOperation(query: query)
        
        //if there is a limit to the number of items
        if let limit = resultsLimit {
            queryOperation.resultsLimit = limit
        }
        
        return queryOperation
    }
    
    static private func addRecordMatchedBlock<Type: CloudKitProtocol>(operation: CKQueryOperation, completion: @escaping (_ item: Type) -> ()) {
        operation.recordMatchedBlock = { (returnedRecordId, returnedResult) in
            switch returnedResult {
                case .success(let record):
                guard let item = Type(record: record) else {return}
                completion(item)
                   
                case .failure:
                    break
            }
        }
    }
    
    static private func addQueryResultBlock(operation: CKQueryOperation, completion: @escaping (_ finished: Bool) -> ()) {
        operation.queryResultBlock = { returnedResult in
            completion(true)
        }
    }
    
    static private func addOperation(publicDb: Bool, operation: CKDatabaseOperation) {
        if publicDb {
            CKContainer.default().publicCloudDatabase.add(operation)
            
        } else {
            CKContainer.default().privateCloudDatabase.add(operation)
        }
    }
    
    static func add<Type: CloudKitProtocol>(publicDb: Bool, item: Type, completion: @escaping (Result<Bool, Error>) -> ()) {
        //Get item record
        let record = item.record

        //Save to CloudKit
        save(publicDb: publicDb, record: record, completion: completion)
    }
    
    static func update<Type: CloudKitProtocol>(publicDb: Bool, item: Type, completion: @escaping (Result<Bool, Error>) -> ()) {
        add(publicDb: publicDb, item: item, completion: completion)
    }

    static private func save(publicDb: Bool, record: CKRecord, completion: @escaping (Result<Bool, Error>) -> ()) {
        if publicDb {
            CKContainer.default().publicCloudDatabase.save(record){ returnedRecord, returnedError in
                if let error = returnedError {
                    completion(.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        } else {
            CKContainer.default().privateCloudDatabase.save(record){ returnedRecord, returnedError in
                if let error = returnedError {
                    completion(.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        }
        
    }
    
    static func delete<Type: CloudKitProtocol>(publicDb: Bool, item: Type) -> Future<Bool, Error> {
        Future { promise in
            CloudKitUtility.delete(publicDb: publicDb, item: item, completion: promise)
        }
    }
    
    static private func delete<Type: CloudKitProtocol>(publicDb: Bool, item: Type, completion: @escaping (Result<Bool, Error>) -> ()) {
        CloudKitUtility.deleteItem(publicDb: publicDb, record: item.record, completion: completion)
    }
    
    static private func deleteItem(publicDb: Bool, record: CKRecord, completion: @escaping (Result<Bool, Error>) -> ()) {
        
        if publicDb {
            CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) {retunedRecordId, returnedError in
                if let error = returnedError {
                    completion (.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        }
        else {
            CKContainer.default().privateCloudDatabase.delete(withRecordID: record.recordID) {retunedRecordId, returnedError in
                if let error = returnedError {
                    completion (.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        }
    }
}

//MARK: Images
extension CloudKitUtility {
    func image(url: URL?) -> UIImage? {
        if let url = url{
            if let data = try? Data(contentsOf: url),  let image = UIImage(data: data){
                return image
            }
        }
        return nil
    }
    
    static func makeURLJPG(image: String) -> URL {
        guard
            let image = UIImage(named: image),
            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("\(image).jpg"),
            let data = image.jpegData(compressionQuality: 1.0) else {return URL(string: "")!}
        
        do {
            try data.write(to: url)
        } catch {
            print(error)
        }
        return url
    }
    
    static func makeURLPNG(image: String) -> URL {
        guard
            let image = UIImage(named: image),
            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("\(image).png"),
            let data = image.pngData() else {return URL(string: "")!}
        
        do {
            try data.write(to: url)
        } catch {
            print(error)
        }
        return url
    }
    
}
