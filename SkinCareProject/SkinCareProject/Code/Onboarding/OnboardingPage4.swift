//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct OnboardingPage4: View {
    @EnvironmentObject var vm: CloudKitModel

    var body: some View {
        ZStack {
            Color.systemBG
                .ignoresSafeArea()
            Image("OnboardingPage4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 145)
            VStack {
                VStack( alignment: .leading, spacing: 40) {
                    Text("Aprenda a composição dos produtos")
                        .font(.largeTitle)
                        .bold()
                    Text("Saiba para o que servem os \ncomponentes químicos dos seus produtos favoritos")
                        .font(.title2)
                }
            
                HStack(alignment: .center) {
                    Button(action: {}) {
                        NavigationLink(destination: QuestionnairePage1( buttonLabel: .next)
                            .environmentObject(vm))
                        {
                            Text("Próximo")
                        }
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                }
                .frame(width: 162.14287, alignment: .center)
            }
            }
            .ignoresSafeArea()
        }
    }

struct OnboardingPage4_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage4()
    }
}





