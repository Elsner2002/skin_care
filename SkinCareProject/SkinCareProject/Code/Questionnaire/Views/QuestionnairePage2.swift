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
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .smallRounded, questionLabel: "Qual seu tipo de pele?", buttonLabels: SkinType.self)
                .frame(width: 334, alignment: .topLeading)
            
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {userInfo.userSkinType = buttonPressed}) {
                        NavigationLink(destination:
                                        QuestionnairePage3(buttonLabel: .next)
                            .environmentObject(vm))
                        {
                            Text(buttonLabel.rawValue)}
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Button(action: {
                        print(vm.user.isEmpty)
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userSkinType: buttonPressed)
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
        .padding(20)
    }
}
struct QuestionnairePage2_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage2(buttonLabel: .save)
    }
}
