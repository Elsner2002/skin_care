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
    @State var fetch = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    ContentView()
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
                if !fetch {
                    @StateObject var vm = CloudKitModel()
                    fetch = true
                }
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
