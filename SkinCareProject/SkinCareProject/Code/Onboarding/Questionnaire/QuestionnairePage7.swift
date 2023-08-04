//
//  QuestionnairePage7.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionnairePage7: View {
    enum PreferenceQuestions: String, CaseIterable {
        case vegan = "Produtos Veganos"
        case none = "Não tenho preferência"
    }
    
    var body: some View {
        VStack{
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 44, alignment: .center)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 51, trailing: 0))
            
            QuestionCard(questionLabel: "Qual seu tipo de pele?", buttonLabels: PreferenceQuestions.self, button: .primary)
            
            HStack {
                NavigationLink(destination: ContentView(), label: { Text("Próximo") })
            }
                    .padding(EdgeInsets(top: 32, leading: 0, bottom: 70, trailing: 0))
//            TerciaryButton(label: "Próximo", description: "implement this", action: {})
//                .frame(width: 165, height: 35.71429, alignment: .topLeading)
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 90, trailing: 0))
            
            Spacer()
        }
        .padding(EdgeInsets(top: 100, leading: 47, bottom: 100, trailing: 47))    }
}

struct QuestionnairePage7_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage7()
    }
}
