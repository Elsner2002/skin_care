//
//  OnboardingModel.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 07/08/23.
//

import Foundation

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
                             subtitle: "Conheça os melhores produtos para sua pele",
                             nextPageButton: true)
let onboardingList: [OnboardingView] = [onboardingView1, onboardingView2, onboardingView3, onboardingView4]

