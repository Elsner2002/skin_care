//
//  QuestionnairePage3.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionnairePage3: View {
    var body: some View {
        VStack(spacing: 32) {
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 35, trailing: 0))
            
            QuestionCard(questionLabel: "Como sua pele fica após horas de exposição ao sol sem proteção solar?", buttonLabels: PhototypeQuestions.self)
            
            HStack {
                NavigationLink(destination: QuestionnairePage4(), label: { Text("Próximo") })
            }
                    .padding(EdgeInsets(top: 32, leading: 0, bottom: 70, trailing: 0))

            
//            TerciaryButton(label: "Próximo", description: "implement this", action: {})
//                .frame(width: 165, height: 35.71429, alignment: .topLeading)
//                .padding(EdgeInsets(top: 32, leading: 0, bottom: 70, trailing: 0))
            Spacer()
        }
        .padding(20)
    }
}


struct QuestionnairePage3_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage3()
    }
}
