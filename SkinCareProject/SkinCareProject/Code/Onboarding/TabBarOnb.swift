//
//  TabBarOnb.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI
import UIKit




struct TabBarOnb: View {
    
    var body: some View {
        let onboardingView1 = OnboardingView(image: "logo",
                                     title: "Skin care é cuidado com sua pele e saúde",
                                     subtitle: "Realize o nosso Quiz e aproveite 100% do nosso aplicativo")
        let onboardingView2 = OnboardingView(image: "logo",
                                     title: "Monte sua rotina e visualize o seu progresso ",
                                     subtitle: "Dê check-in nos passos da sua rotina e mantenha o seu progresso sempre atualizado")
        let onboardingView3 = OnboardingView(image: "logo",
                                     title: "Receba recomendações e alcance seus objetivos",
                                     subtitle: "Conheça os melhores produtos para sua pele")
        let onboardingView4 = OnboardingView(image: "logo",
                                     title: "Aprenda fórmula e composição dos produtos",
                                     subtitle: "Conheça os melhores produtos para sua pele")
        let onboardingList: [OnboardingView] = [onboardingView1, onboardingView2, onboardingView3, onboardingView4]
        
        NavigationStack{
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                        Text("Pular")
                            .font(.system(size: 20))
                            .foregroundColor(Color(uiColor: .black))
                    }).padding(25)
                }
                TabView {
                    ForEach(onboardingList, id: \.self) {
                        onboarding in OnboardingView(image: onboarding.image , title: onboarding.title, subtitle: onboarding.subtitle)
                    }
                }
                .tabViewStyle(.page)
            }
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .red
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarOnb_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOnb()
    }
}
