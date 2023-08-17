//
//  QuestionnairePage7.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionnairePage7: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var vm: CloudKitModel
    @State var buttonPressed: String = ""
    var buttonLabel: buttonLabels
    @State var navigateToNext: Bool = false
    @State var nextPage: Bool = false


    
    var body: some View {
        VStack {
            ProgressBar(progress: 100)
                .padding()
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .largeRounded,
                         questionLabel: "Você tem uma preferência por produtos?",
                         buttonLabels: PreferenceQuestions.self)
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {
                        userInfo.userVegan = buttonPressed == "Produtos Veganos"
                        vm.NEW_updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userInfo: userInfo)
                        self.nextPage = true
                    }) {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))

                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: buttonPressed == "Produtos Veganos")
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
        .onAppear {
            print(userInfo.userSkinType)
        }
        .padding(20)
        .navigationDestination(isPresented: $nextPage, destination: {ContentView() })
    }
}
