//
//  QuestionnairePage7.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionnairePage7: View {
    var body: some View {
        VStack {
            ProgressView("", value: 100, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonType: .largeRounded,
                         questionLabel: "Você tem uma preferência por produtos?",
                         buttonLabels: PreferenceQuestions.self)
                .frame(width: 291, alignment: .topLeading)
            HStack {
                NavigationLink(destination: HomeView(),
                               label: {CustomButton(label: "Próximo", action: {}, description: "Description", buttonType: .smallRounded) })
            }
                .frame(width: 165, height: 35.71429, alignment: .topLeading)
                .padding(EdgeInsets(top: 350, leading: 0, bottom: 70, trailing: 0))
        }
        .padding(20)
    }
}

struct QuestionnairePage7_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage7()
    }
}
