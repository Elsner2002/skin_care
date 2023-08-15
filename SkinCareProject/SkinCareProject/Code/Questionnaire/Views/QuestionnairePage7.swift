//
//  QuestionnairePage7.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionnairePage7: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""
    
    var body: some View {
        VStack {
            ProgressView("", value: 100, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonPressed: .constant(""), buttonType: .largeRounded,
                         questionLabel: "Você tem uma preferência por produtos?",
                         buttonLabels: PreferenceQuestions.self)
                .frame(width: 291, alignment: .topLeading)
            HStack(alignment: .center) {
                Button(action: {userInfo.userPhototype = buttonPressed}) {
                    NavigationLink(destination: QuestionnairePage4())
                    {
                        Text("Próximo")
                    }
                }
                .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))

            }
                .frame(width: 162.14287, alignment: .center)
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
