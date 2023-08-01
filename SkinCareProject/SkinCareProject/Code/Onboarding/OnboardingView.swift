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
    
    var body: some View {
        VStack{
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 350, height: 177)
            }
            
            VStack{
                Text(title)
                    .bold()
                    .font(.system(size: 34))
                    .multilineTextAlignment(.leading)
                    .frame(width: 347, alignment: .topLeading)
                    .padding(EdgeInsets(top: 70, leading: 0, bottom: 20, trailing: 0))

                Text(subtitle)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .frame(width: 347, alignment: .topLeading)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))


                
                Spacer()
            }
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
