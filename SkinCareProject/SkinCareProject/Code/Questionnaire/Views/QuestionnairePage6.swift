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
    @State var navigateToNext: Bool = false
    @State var nextPage: Bool = false



    var body: some View {
        VStack {
            ProgressBar(progress: 80)
                .padding()
            QuestionCard(buttonPressed: $buttonPressed, buttonType: .largeRounded,
                         questionLabel: "Como você descreveria o lugar onde mais passa seu tempo?",
                         buttonLabels: EnvironmentQuestions.self)
            HStack(alignment: .center) {
                if buttonLabel == .next {
                    Button(action: {
                        userInfo.userLocation = buttonPressed
                        self.nextPage = true
                    }) {
                        Text(buttonLabel.rawValue)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                } else {
                    Button(action: {
                        vm.updateUser(publicDb: false, appUser: vm.user[0], recordType: .User, userVegan: vm.user[0].vegan, userLocation: buttonPressed)
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
        .navigationDestination(isPresented: $nextPage, destination: { QuestionnairePage7(buttonLabel: .next) })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnairePage6(buttonLabel: .next)
    }
}
