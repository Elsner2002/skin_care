//
//  TabBarOnb.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI
import UIKit


struct TabBarOnb: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Spacer()
                    //controls back button navigation
                    NavigationLink(destination: TabBarQuest().navigationBarBackButtonHidden(true), label: {
                        Text("Pular")
                            .font(.callout)
                            .foregroundColor(Color(uiColor: .black))
                    }).padding(20)
                }
                TabView {
                    ForEach(onboardingList, id: \.self) {
                        onboarding in OnboardingView(image: onboarding.image , title: onboarding.title, subtitle: onboarding.subtitle)
                    }
                }
                .tabViewStyle(.page)
            }
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .black
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
            }
            Spacer(minLength: 55)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarOnb_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOnb()
    }
}
