//
//  QuestionnairePage1.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI

struct QuestionnairePage1: View, Hashable {
    
    
    var body: some View {
        
        VStack {
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 44, alignment: .center)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 51, trailing: 0))
 
            QuestionCard(questionLabel: "Qual seu gênero?", buttonLabels: Gender.self, button: .primary)
            
            VStack(spacing: 50) {
                WheelPicker(questionLabel: "Qual sua idade?")
                    .frame(height: 220)
                HStack(alignment: .center){
                    TerciaryButton(label: "Responder Depois", description: "implement this")
                    TerciaryButton(label: "Próximo", description: "implement this")
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 77, trailing: 0))
            }
        }
        .padding(20)

    }
    
}


struct QuestionnairePage1_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage1()
    }
}
