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
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var vm: CloudKitModel
    @State var buttonPressed: Set<String> = []
    var buttonLabel: buttonLabels

    var body: some View {
        VStack {
            ProgressView("", value: 60, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            
            QuestionCardMultipleChoice(buttonPressed: $buttonPressed, questionLabel: "Quais suas principais preocupações?", buttonLabels: ConcernsQuestion.self)
                .frame(width: 334, alignment: .topLeading)
            
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userConditions: Array(buttonPressed))}) {
                        NavigationLink(destination:
                                        QuestionnairePage6()
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
                .frame(width: 162.14287, alignment: .center)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 70, trailing: 0))
        }
        .padding(20)
    }
}
struct QuestionnairePage5_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage5(buttonLabel: .next)
    }
}
