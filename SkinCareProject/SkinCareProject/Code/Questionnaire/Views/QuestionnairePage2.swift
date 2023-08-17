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


struct QuestionnairePage2: View {
    @EnvironmentObject var vm: CloudKitModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""
    var buttonLabel: buttonLabels
    
    var body: some View {
        VStack {
            ProgressBar(progress: 20)
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .smallRounded, questionLabel: "Qual seu tipo de pele?", buttonLabels: SkinTypeQuestion.self)
                .frame(width: 334, alignment: .topLeading)
            Spacer(minLength: 185)
            HStack {
                if buttonLabel == .next {
                    Button(action: {userInfo.userSkinType = buttonPressed}) {
                        NavigationLink(destination:
                                        QuestionnairePage3(buttonLabel: .next)
                            .environmentObject(vm))
                        { Text(buttonLabel.rawValue)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userSkinType: buttonPressed)
                        dismiss()
                    }, label: {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                }
            }
            .frame(width: 165, height: 35.71429, alignment: .topLeading)
        }
        .padding(30)
    }
}

struct QuestionnairePage2_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage2(buttonLabel: .save)
    }
}
