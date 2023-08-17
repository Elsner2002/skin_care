//
//  QuestionnairePage1.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI

struct QuestionnairePage1: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vm: CloudKitModel
    @EnvironmentObject var userInfo: UserInfo
    @State var buttonPressed: String = ""
    @State var selected: Int = 18
    var buttonLabel: buttonLabels
    
    var body: some View {
        VStack(spacing: 30) {
            ProgressBar(progress: 10.0)
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .largeRounded,questionLabel: "Qual seu gênero?", buttonLabels: GenderQuestion.self)
            WheelPicker(selected: $selected, questionLabel: "Qual sua idade?")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 51, trailing: 0))
            HStack(alignment: .center){
                if buttonLabel == .next {
                    NavigationLink("Responder Depois", destination: ContentView()
                        .navigationBarBackButtonHidden(true)
                        .environmentObject(vm))
                        .buttonStyle(CustomButtonStyle(buttonType: .largeRounded))
                    Button(action: {
                        userInfo.userGender = buttonPressed
                        userInfo.userAge = selected
                    }) {
                        NavigationLink(destination:
                                        QuestionnairePage2(buttonLabel: .next)
                            .environmentObject(userInfo)
                            .environmentObject(vm))
                        {
                            Text(buttonLabel.rawValue)
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))

                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userGender: buttonPressed, userAge: selected)
                        dismiss()
                    }, label: {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                }
            }
            .padding(10)
            .frame(width: 380, height: 35.71429, alignment: .center)
        }
        .padding(30)
    }
}

struct QuestionnairePage1_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage1(buttonLabel: .next)
    }
}
