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
    @StateObject private var vm = CloudKitModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    ContentView()
                    //CloudKitViewModel()
//                    if firstTimeHere {
//                        TabBarOnb()
//                    }
//                    else {
//                        ContentView()
//                    }
                }
                else {
                    Splashscreen()
                }
            }
            .onAppear {
                @StateObject var vm = CloudKitModel()
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
