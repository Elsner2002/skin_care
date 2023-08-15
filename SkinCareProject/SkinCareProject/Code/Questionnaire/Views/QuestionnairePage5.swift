//
//  QuestionnairePage2.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

struct QuestionnairePage5: View{
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""

    var body: some View {
        VStack {
            ProgressView("", value: 60, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonPressed: .constant(""),buttonType: .largeRoundedOverlay,
                         questionLabel: "Quais suas principais preocupações?",
                         buttonLabels: ConcernsQuestion.self)
                .frame(width: 334, alignment: .topLeading)
            
            HStack(alignment: .center) {
                Button(action: {userInfo.userPhototype = buttonPressed}) {
                    NavigationLink(destination: QuestionnairePage6())
                    {
                        Text("Próximo")
                    }
                }
                .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))

            }
                .frame(width: 162.14287, alignment: .center)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 70, trailing: 0))
        }
        .padding(20)
    }
}
struct QuestionnairePage5_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage5()
    }
}
