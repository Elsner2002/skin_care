//
//  QuestionnairePage2.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

struct QuestionnairePage5: View, Hashable {
    
    enum ConcernsQuestion: String, CaseIterable {
        case acne = "Espinhas e Cravos"
        case pigmentation = "Manchas"
        case aging = "Rugas e Linhas de expressão"
        case darkCircles = "Olheiras"
        case redness = "Vermelhidão"
        case scars = "Estrias e Cicatrizes"
        
    }
    var body: some View {
        
        VStack{
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 44, alignment: .center)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 51, trailing: 0))
            
            QuestionCard(questionLabel: "Qual seu tipo de pele?", buttonLabels: ConcernsQuestion.self, button: .primary)
            
            HStack {
                NavigationLink(destination: QuestionnairePage6(), label: { Text("Próximo") })
            }
                    .padding(EdgeInsets(top: 32, leading: 0, bottom: 70, trailing: 0))
            
//            TerciaryButton(label: "Próximo", description: "implement this", action: {})
//                .frame(width: 165, height: 35.71429, alignment: .topLeading)
//                .padding(EdgeInsets(top: 100, leading: 0, bottom: 90, trailing: 0))
            
            Spacer()
        }
        .padding(EdgeInsets(top: 100, leading: 47, bottom: 100, trailing: 47))
    }
}
struct QuestionnairePage5_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage5()
    }
}
