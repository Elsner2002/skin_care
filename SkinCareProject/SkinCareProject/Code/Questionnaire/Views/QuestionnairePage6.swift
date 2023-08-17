//
//  SwiftUIView.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionnairePage6: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var vm: CloudKitModel
    @State var buttonPressed: String = ""
    var buttonLabel: buttonLabels

    var body: some View {
        VStack {
            ProgressView("", value: 80, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .largeRounded,
                         questionLabel: "Como você descreveria o lugar onde mais passa seu tempo?",
                         buttonLabels: EnvironmentQuestions.self)
                .frame(width: 291, alignment: .topLeading)
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {userInfo.userLocation = buttonPressed}) {
                        NavigationLink(destination:
                                        QuestionnairePage7(buttonLabel: .next)
                            .environmentObject(vm))
                        {
                            Text(buttonLabel.rawValue)}
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userLocation: buttonPressed)
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
                .padding(EdgeInsets(top: 200, leading: 0, bottom: 70, trailing: 0))
        }
        .padding(20)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage6(buttonLabel: .next)
    }
}
