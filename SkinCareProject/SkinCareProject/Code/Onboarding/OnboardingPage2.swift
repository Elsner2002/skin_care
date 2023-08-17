//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage2: View, Hashable {
    var body: some View {
        ZStack {
            Color.systemBG
                .ignoresSafeArea()
            Image("Onb2")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .padding(.top, 210)
            VStack(alignment: .leading, spacing: 44) {
                Text("Monte sua rotina e visualize o seu \nprogresso")
                    .font(.largeTitle)
                    .bold()
                Text("Dê check-in nos passos da sua rotina e mantenha o seu progresso sempre atualizado")
                    .font(.title2)
            }
        }
    }
}

struct OnboardingPage2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage2()
    }
}




