//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage1: View, Hashable {
    var body: some View {
        ZStack {
            Color.systemBG
                .ignoresSafeArea()
            Image("OnboardingPage1")
                .resizable()
                .aspectRatio(contentMode: .fill)

            VStack(alignment: .leading, spacing: 44) {
                Text("Skin care é cuidado com sua pele e saúde")
                    .font(.largeTitle)
                    .bold()
                Text("Realize o nosso Quiz e aproveite 100% do nosso aplicativo")
                    .font(.title2)
            }
            .padding(10)
        }
        .ignoresSafeArea()
    }
}

struct OnboardingPage1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage1()
    }
}


