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
    
    var body: some View {
        VStack {
            ProgressView("", value: 40, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCardMultipleChoice(buttonPressed: $buttonPressed, questionLabel: "Marque se você possui alguma das seguintes condições de pele:", buttonLabels: SkinConditionQuestion.self)
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))

            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userConditions: Array(buttonPressed))}) {
                        NavigationLink(destination:
                                        QuestionnairePage5(buttonLabel: .next)
                            .environmentObject(vm))
                        {
                            Text(buttonLabel.rawValue)}
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userConditions: Array(buttonPressed))
                        dismiss()
                    }, label: {
                        Text(buttonLabel.rawValue)
                    })
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .padding(EdgeInsets(top: 107, leading: 0, bottom: 55, trailing: 0))

        }
    }
}

struct QuestionnairePage4_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage4(buttonLabel: .next)
    }
}
