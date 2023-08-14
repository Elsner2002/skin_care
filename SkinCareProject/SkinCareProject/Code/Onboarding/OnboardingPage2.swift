//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage2: View, Hashable {
    var body: some View {
        VStack{
            ZStack {
                Image("OnboardingPage2")
                    .padding(EdgeInsets(top: 300, leading: 0, bottom: 0, trailing: 0))
                VStack(spacing: 21){
                    Text("Monte sua rotina e visualize o seu progresso")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 359, alignment: .topLeading)
                    Text("Dê check-in nos passos da sua rotina e mantenha o seu progresso sempre atualizado")
                        .font(.callout)
                        .frame(width: 347, alignment: .topLeading)
                }
                Spacer()
            }
          
        }
    }
}

struct OnboardingPage2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage2()
    }
}




