//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage3: View, Hashable {
    var body: some View {
        VStack{
            ZStack {
                Image("OnboardingPage3")
                    .padding(EdgeInsets(top: 165, leading: 0, bottom: 162, trailing: 0))
                VStack(spacing: 21){
                    Text("Receba recomendações e alcance seus objetivos")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 359, alignment: .topLeading)
                    Text("Conheça os melhores produtos para sua pele")
                        .font(.callout)
                        .frame(width: 347, alignment: .topLeading)
                }
                Spacer()
            }
          
        }
    }
}

struct OnboardingPage3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage3()
    }
}




