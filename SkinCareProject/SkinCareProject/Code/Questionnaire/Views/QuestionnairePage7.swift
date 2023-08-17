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

    
    var body: some View {
        VStack {
            ProgressView("", value: 100, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .largeRounded,
                         questionLabel: "Você tem uma preferência por produtos?",
                         buttonLabels: PreferenceQuestions.self)
                .frame(width: 291, alignment: .topLeading)
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {
                        navigateToNext.toggle()
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: buttonPressed == "Produtos Veganos")
                        vm.NEW_updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userInfo: userInfo)
                    }, label: {
                        Text(buttonLabel.rawValue)
                    })
                        .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                        .frame(width: 165, height: 35.71429, alignment: .center)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: buttonPressed == "Produtos Veganos")
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
            .padding(EdgeInsets(top: 350, leading: 0, bottom: 70, trailing: 0))
            
           NavigationLink(destination: ContentView(), isActive: $navigateToNext, label: { EmptyView() })
        }
        .padding(20)
    }
}
    //.navigationDestination(isPresented: navigateToNext, destination: ContentView())

