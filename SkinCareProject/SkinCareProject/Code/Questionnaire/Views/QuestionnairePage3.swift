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


struct QuestionnairePage3: View {
    @EnvironmentObject var vm: CloudKitModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""
    var buttonLabel: buttonLabels
    
    var body: some View {
        VStack(spacing: 30) {
            ProgressBar(progress: 30)
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .smallRounded, questionLabel: "Como sua pele fica após horas de exposição ao sol sem proteção ?", buttonLabels: PhototypeQuestion.self)
            
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {userInfo.userPhototype = buttonPressed}) {
                        NavigationLink(destination: QuestionnairePage4(buttonLabel: .next))
                            {Text(buttonLabel.rawValue)}
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userPhototype: buttonPressed)
                        dismiss()
                    }, label: {
                        Text(buttonLabel.rawValue)
                    })
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                }
            }
            Spacer(minLength: 70)
        }
        .padding()
        .frame(width: 380, height: 35.71429, alignment: .center)
    }
}
struct QuestionnairePage3_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage3(buttonLabel: .save)
    }
}

