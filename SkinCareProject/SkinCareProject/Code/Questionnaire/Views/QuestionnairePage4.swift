//
//  QuestionnairePage4.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionnairePage4: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: Set<String> = []
    
    var body: some View {
        VStack {
            ProgressView("", value: 40, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCardMultipleChoice(buttonPressed: $buttonPressed, buttonType: .largeRoundedOverlay, questionLabel: "Marque se você possui alguma das seguintes condições de pele:", buttonLabels: SkinConditionQuestion.self)
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))

            HStack(alignment: .center) {
                Button(action: {userInfo.userConditions = Array(buttonPressed)}) {
                    NavigationLink(destination: QuestionnairePage5())
                    {
                        Text("Próximo")
                    }
                }
                .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
            }
            .padding(EdgeInsets(top: 107, leading: 0, bottom: 55, trailing: 0))

        }
    }
}

struct QuestionnairePage4_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage4()
    }
}
