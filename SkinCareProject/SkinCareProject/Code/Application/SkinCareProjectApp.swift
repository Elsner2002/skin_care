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
//                if !fetch {
//                    @StateObject var vm = CloudKitModel()
//                    fetch = true
//                }
                if firstTimeHere {
                    vm.addUser(publicDb: false, name: vm.userName, recordType: .AppUser)
                }
                vm.fetchItems(publicDb: false, recordType: .AppUser)

                //Constants.shared.randomTipGenerator()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
