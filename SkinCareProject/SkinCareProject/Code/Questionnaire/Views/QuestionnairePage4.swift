//
//  QuestionnairePage4.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionnairePage4: View {
    @EnvironmentObject var vm: CloudKitModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: Set<String> = []
    var buttonLabel: buttonLabels
    @State var nextPage: Bool = false

    
    var body: some View {
        VStack {
            ProgressBar(progress: 40)
                .padding()
            
            QuestionCardMultipleChoice(buttonPressed: $buttonPressed, questionLabel: "Marque se você possui alguma das seguintes condições de pele:", buttonLabels: SkinConditionQuestion.self)
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))

            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {
                        userInfo.userConditions = Array(buttonPressed)
                        self.nextPage = true
                    }) {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userConditions: Array(buttonPressed))
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
        .navigationDestination(isPresented: $nextPage, destination: { QuestionnairePage5(buttonLabel: .next) })

    }
}

struct QuestionnairePage4_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage4(buttonLabel: .next)
    }
}
