//
//  TabBarOnb.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI
import UIKit


struct TabBarOnb: View {
    
    @EnvironmentObject var vm: CloudKitModel

    
    var body: some View {
        NavigationStack{
            ZStack {
                TabView {
                    OnboardingPage1()
                    OnboardingPage2()
                    OnboardingPage3()
                    OnboardingPage4()
                }
                .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        //controls back button navigation
                        NavigationLink(destination: TabBarQuest()
                            .navigationBarBackButtonHidden(true)
                            .environmentObject(vm),
                            label: {
                            Text("Pular")
                                .font(.callout)
                                .foregroundColor(Color(uiColor: .black))
                        })
                        .padding(20)
                    }
                    Spacer()
                }
            }
            .tabViewStyle(.page)
        }
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))

    }
}


struct TabBarOnb_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOnb()
    }
}
