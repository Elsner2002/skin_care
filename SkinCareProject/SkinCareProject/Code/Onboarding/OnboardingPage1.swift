//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage1: View, Hashable {
    var body: some View {
        VStack{
            ZStack {
                Image("OnboardingPage1")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 576, trailing: 0))
                VStack(spacing: 21){
                    Text("Skin care é cuidado com sua pele e saúde")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 359, alignment: .topLeading)
                    Text("Realize o nosso Quiz e aproveite 100% do nosso aplicativo")
                        .font(.callout)
                        .frame(width: 347, alignment: .topLeading)
                }
                Spacer()
            }
          
        }
    }
}

struct OnboardingPage1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage1()
    }
}



