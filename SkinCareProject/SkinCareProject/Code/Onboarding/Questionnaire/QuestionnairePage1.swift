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
            ProgressBar(progress: 20.0)
            QuestionCard(questionLabel: "Qual seu gênero?", buttonLabels: Gender.self)
            
            VStack(spacing: 50) {
                WheelPicker(questionLabel: "Qual sua idade?")
                    .frame(height: 220)
                HStack(alignment: .center){
                    NavigationLink(destination: QuestionnairePage2(), label: {PrimaryButton(label: "Próximo", description: "description", action: {})})
                    
                    //                    TerciaryButton(label: "Responder Depois", description: "implement this", action: {})
                    //                    TerciaryButton(label: "Próximo", description: "implement this", action: {})
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
