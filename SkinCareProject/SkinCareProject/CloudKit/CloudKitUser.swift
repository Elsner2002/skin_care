//
//  CloudKitUser.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 26/07/23.
//

import SwiftUI
import CloudKit

class CloudKitUserViewModel: ObservableObject {
    
    @Published var isSignedToiCloud: Bool = false
    @Published var permissionStatus: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""

    
    init() {
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    
    private func getiCloudStatus() {
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in DispatchQueue.main.async {
            switch returnedStatus {
            case .available:
                self?.isSignedToiCloud = true
            case  .noAccount:
                self?.error =  CloudKitError.iCloudAccountNotFound.localizedDescription
            case .couldNotDetermine:
                self?.error =  CloudKitError.iCloudAccountNotDetermined.localizedDescription
            case .restricted:
                self?.error =  CloudKitError.iCloudAccountRestricted.localizedDescription
            default:
                self?.error =  CloudKitError.iCloudAccountUnknown.localizedDescription
            }
            }
        }
    }
    
    enum CloudKitError: LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission() {
        CKContainer.default().requestApplicationPermission([.userDiscoverability ]) {[weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.permissionStatus = true
                }
            }
        }
    }
    
    func fetchiCloudUserRecordID() {
        CKContainer.default().fetchUserRecordID {[weak self] returnedID, returnedError in
            if let id = returnedID {
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
    func discoveriCloudUser(id: CKRecord.ID) {
        CKContainer.default().discoverUserIdentity( withUserRecordID: id) {[weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName {
                    self?.userName = name
                    //returnedIdentity.data we want
                }
            }
        }
    }
}

struct CloudKitUser: View {
    @StateObject private var vm = CloudKitUserViewModel()
    
    var body: some View {
        VStack {
            Text("CloudKit User")
            Text("is signed in: \(vm.isSignedToiCloud.description)")
            Text("Name: \(vm.userName)")
        }
        
    }
}

struct CloudKitUser_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUser()
    }
}
