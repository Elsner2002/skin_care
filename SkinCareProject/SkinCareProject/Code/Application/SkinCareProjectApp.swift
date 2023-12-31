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
    @StateObject var vm = CloudKitModel()
    @StateObject var userInfo = UserInfo()

    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.vm.isLoading {
                    if self.isActive {
                        if firstTimeHere {
                            TabBarOnb()
                                .environmentObject(vm)
                                .environmentObject(userInfo)
                                .navigationBarBackButtonHidden(true)
                        }
                        else {
                            ContentView()
                                .environmentObject(vm)
                                .environmentObject(userInfo)
                        }
                    } else {
                        SplashAnimation()
                    }
                }
            }
            .onAppear {
                if firstTimeHere {
                    vm.addUser(publicDb: false, name: vm.userName, recordType: .User)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
                
            }
        }
    }
}
