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
    @State var nextPage: Bool = false


    var body: some View {
        VStack {
            ProgressBar(progress: 60)
                .padding()
            
            QuestionCardMultipleChoice(buttonPressed: $buttonPressed, questionLabel: "Quais suas principais preocupações?", buttonLabels: ConcernsQuestion.self)
                .frame(width: 334, alignment: .topLeading)
            
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
                .frame(width: 162.14287, alignment: .center)
                .padding()
        }
        .padding()
        .navigationDestination(isPresented: $nextPage, destination: { QuestionnairePage6(buttonLabel: .next) })
    }
}
struct QuestionnairePage5_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage5(buttonLabel: .next)
    }
}
