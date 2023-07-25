//
//  TabBarOnb.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct TabBarOnb: View {
    
    var body: some View {
        let onboarding1 = Onboarding(image: "image1", title: "title1", subtitle: "subtitle1")
        let onboarding2 = Onboarding(image: "image2", title: "title2", subtitle: "subtitle2")
        let onboarding3 = Onboarding(image: "image3", title: "title3", subtitle: "subtitle3")
        let onboardingList: [Onboarding] = [onboarding1, onboarding2, onboarding3]
        
        NavigationStack{
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                        Text("Pular")
                            .font(.system(size: 20))
                            .foregroundColor(Color(uiColor: .lightGray))
                    }).padding(25)
                }
                TabView {
                    ForEach(onboardingList, id: \.self) {
                        onboarding in Onboarding(image: onboarding.image , title: onboarding.title, subtitle: onboarding.subtitle)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarOnb_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOnb()
    }
}
