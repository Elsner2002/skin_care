//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingView: View, Hashable {
    var image: String
    var title: String
    var subtitle: String
    var nextPageButton: Bool?
    
    var body: some View {
        VStack{
            VStack(spacing: 21){
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .frame(width: 359, alignment: .topLeading)
                Text(subtitle)
                    .font(.callout)
                    .bold()
                    .frame(width: 347, alignment: .topLeading)
            }
            .padding(EdgeInsets(top: 300, leading: 0, bottom: 0, trailing: 0))
            Spacer()
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(image: "logo",
                       title: "Skin care é cuidado com sua pele e saúde",
                       subtitle: "Realize o nosso Quiz e aproveite 100% do nosso aplicativo")
    }
}



