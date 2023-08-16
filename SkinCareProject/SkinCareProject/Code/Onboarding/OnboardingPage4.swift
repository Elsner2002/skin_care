//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage4: View, Hashable {
    var body: some View {
        ZStack {
            Color.systemBG
                .ignoresSafeArea()
            Image("OnboardingPage4")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .padding(.top, 203)
            VStack {
                VStack( alignment: .leading, spacing: 44) {
                    Text("Aprenda a composição dos produtos")
                        .font(.largeTitle)
                        .bold()
                    Text("Saiba para o que servem os \ncomponentes químicos dos seus produtos favoritos")
                        .font(.title2)
                }
                .padding(.bottom, 140)
                CustomButton(label: "Próximo", description: "", buttonType: .smallRounded, action: {})
                    .frame(width: 162.14287, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            }
        }
    }
}

struct OnboardingPage4_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage4()
    }
}





