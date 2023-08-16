//
//  SkinCareProjectApp.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import SwiftUI

@main
struct SkinCareProjectApp: App {
    @State var firstTimeHere: Bool = UserDefaults.standard.value(forKey: "firstTimeHere") as? Bool ?? true
    @State private var isActive = false
//    @State var fetch = false
//    @StateObject private var vm = Constants.shared.vm
    @StateObject var vm = CloudKitModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    if firstTimeHere {
                        TabBarOnb()
                            .environmentObject(vm)
                    }
                    else {
                        ContentView()
                            .environmentObject(vm)
                    }
                }
                else {
                    Splashscreen()
                }
            }
            .onAppear {
                if firstTimeHere {
                    vm.addUser(publicDb: false, name: vm.userName, recordType: .User)
                }
               // vm.fetchItems(publicDb: true, recordType: .User)

                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
