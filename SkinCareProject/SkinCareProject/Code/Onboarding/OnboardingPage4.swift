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
                HStack(alignment: .center) {
                    Button(action: {}) {
                        NavigationLink(destination: ContentView()
                            .environmentObject(vm))
                        {
                            Text("Próximo")
                        }
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                }
                .frame(width: 161, height: 36, alignment: .topLeading)
                .padding(EdgeInsets(top: 350, leading: 0, bottom: 70, trailing: 0))
                
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





