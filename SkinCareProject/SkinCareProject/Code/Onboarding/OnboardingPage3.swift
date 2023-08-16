//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage3: View, Hashable {
    var body: some View {
        ZStack {
            Color.systemBG
                .ignoresSafeArea()
            Image("OnboardingPage3")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .padding(.top, 165)
            VStack(alignment: .leading, spacing: 44) {
                Text("Receba recomendações e alcance seus objetivos")
                    .font(.largeTitle)
                    .bold()
                Text("Conheça os melhores produtos para sua pele")
                    .font(.title2)
            }
            .padding()
        }
    }
}

struct OnboardingPage3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage3()
    }
}
