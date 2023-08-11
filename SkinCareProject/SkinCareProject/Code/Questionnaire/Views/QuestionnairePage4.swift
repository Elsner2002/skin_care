//
//  QuestionnairePage4.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionnairePage4: View {
    var body: some View {
        VStack {
            ProgressView("", value: 40, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonType: .largeRounded, questionLabel: "Marque se você possui alguma das seguintes condições de pele:", buttonLabels: SkinConditionQuestion.self)
            HStack {
                NavigationLink(destination: QuestionnairePage5(), label: {CustomButton(label: "Próximo", action: {}, description: "Description", buttonType: .smallRounded) })
            }
                .frame(width: 165, height: 35.71429, alignment: .topLeading)
                .padding(EdgeInsets(top: 160, leading: 0, bottom: 70, trailing: 0))
        }
        .padding(20)
    }
}

struct QuestionnairePage4_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage4()
    }
}
