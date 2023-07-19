//
//  SkinCareProjectApp.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import SwiftUI

@main
struct SkinCareProjectApp: App {
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    ContentView()
                }
                else {
                    Splashscreen()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
