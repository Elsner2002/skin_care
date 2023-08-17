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
    @State var nextPage: Bool = false

    var body: some View {
        VStack(spacing: 30) {
            ProgressBar(progress: 30)
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .smallRounded, questionLabel: "Como sua pele fica após horas de exposição ao sol sem proteção ?", buttonLabels: PhototypeQuestion.self)
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {
                        userInfo.userPhototype = buttonPressed
                        self.nextPage = true
                    }) {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
 
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userPhototype: buttonPressed)
                        dismiss()
                    }, label: {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)

                    })
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                }
            }
            .frame(width: 165, height: 35.71429, alignment: .topLeading)
            .padding()

        }
        .padding()
        .navigationDestination(isPresented: $nextPage, destination: { QuestionnairePage4(buttonLabel: .next) })
    }
}
struct QuestionnairePage3_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage3(buttonLabel: .save)
    }
}

