//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage4: View, Hashable {
    var body: some View {
        VStack{
            ZStack {
                Image("OnboardingPage4")
                    .padding(EdgeInsets(top: 177, leading: 0, bottom: 0, trailing: 0))
                VStack(spacing: 21){
                    Text("Aprenda a composição dos produtos")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 359, alignment: .topLeading)
                    Text("Saiba para o que servem os componentes químicos dos seus produtos favoritos")
                        .font(.callout)
                        .frame(width: 347, alignment: .topLeading)
                    
                    CustomButton(label: "Próximo", action: {}, description: "", buttonType: .smallRounded)
                        .frame(width: 162.14287, alignment: .center)
                        .padding(EdgeInsets(top: 139, leading: 0, bottom: 0, trailing: 0))
                }
            }
          
        }
    }
}

struct OnboardingPage4_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage4()
    }
}





