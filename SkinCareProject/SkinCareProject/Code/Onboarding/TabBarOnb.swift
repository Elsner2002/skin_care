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
    @State var selected: Int = 0

    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.systemBG
                    .ignoresSafeArea()
                TabView(selection: $selected) {
                    OnboardingPage1()
                        .tag(0)
                    OnboardingPage2()
                        .tag(1)
                    OnboardingPage3()
                        .tag(2)
                    OnboardingPage4()
                        .tag(3)
                }
                .tabViewStyle(.page)
                .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        if selected != 3 {
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
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

    }
}


struct TabBarOnb_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOnb()
    }
}
