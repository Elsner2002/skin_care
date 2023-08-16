//
//  SwiftUIView.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionnairePage6: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""
    
    var body: some View {
        VStack {
            ProgressView("", value: 80, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonPressed: .constant(""), buttonType: .largeRounded,
                         questionLabel: "Como você descreveria o lugar onde mais passa seu tempo?",
                         buttonLabels: EnvironmentQuestions.self)
                .frame(width: 291, alignment: .topLeading)
            HStack(alignment: .center) {
                Button(action: {userInfo.userPhototype = buttonPressed}) {
                    NavigationLink(destination: QuestionnairePage7())
                    {
                        Text("Próximo")
                    }
                }
                .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))

            }
                .frame(width: 162.14287, alignment: .center)
                .padding(EdgeInsets(top: 200, leading: 0, bottom: 70, trailing: 0))
        }
        .padding(20)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage6()
    }
}
