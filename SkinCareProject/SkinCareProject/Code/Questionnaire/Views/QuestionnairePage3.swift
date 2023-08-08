//
//  QuestionnairePage3.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionnairePage3: View {
    var body: some View {
        VStack {
            ProgressView("", value: 30, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonType: .largeRounded, questionLabel: "Como sua pele fica após horas de exposição ao sol sem proteção solar?", buttonLabels: PhototypeQuestions.self)
                .frame(width: 334, alignment: .topLeading)
            HStack {
                NavigationLink(destination: QuestionnairePage4(), label: {CustomButton(label: "Próximo", action: {}, description: "Description", buttonType: .smallRounded) })
            }
                .frame(width: 165, height: 35.71429, alignment: .topLeading)
                .padding(EdgeInsets(top: 60, leading: 0, bottom: 70, trailing: 0))

        }
        .padding(20)
    }
}


struct QuestionnairePage3_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage3()
    }
}
