//
//  QuestionnairePage3.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionnairePage3: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""
    
    var body: some View {
        VStack {
            ProgressView("", value: 30, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            QuestionCard(buttonPressed: .constant(""), buttonType: .largeRounded, questionLabel: "Como sua pele fica após horas de exposição ao sol sem proteção solar?", buttonLabels: PhototypeQuestions.self)
                .frame(width: 334, alignment: .topLeading)
            Spacer()
            
            HStack(alignment: .center) {
                Button(action: {userInfo.userPhototype = buttonPressed}) {
                    NavigationLink(destination: QuestionnairePage4())
                    {
                        Text("Próximo")
                    }
                }
                .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 55, trailing: 0))
        }
    }
}

struct QuestionnairePage3_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage3()
    }
}
