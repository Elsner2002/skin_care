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
    @StateObject var userInfo = UserInfo()
    @EnvironmentObject var vm: CloudKitModel
    var buttonLabel: buttonLabels
    
    var body: some View {
        VStack {
            ProgressBar(progress: 10.0)
            QuestionCard(buttonPressed: .constant(""), buttonType: .largeRounded,questionLabel: "Qual seu gênero?", buttonLabels: Gender.self)
            WheelPicker(questionLabel: "Qual sua idade?")
                .frame(height: 220)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 51, trailing: 0))
            HStack(alignment: .center){
                if buttonLabel == .next {
                    NavigationLink("Responder Depois", destination: ContentView()
                        .navigationBarBackButtonHidden(true)
                        .environmentObject(vm))
                        .buttonStyle(CustomButtonStyle(buttonType: .largeRounded))
                    NavigationLink("Próximo", destination: QuestionnairePage2(buttonLabel: .next)
                        .environmentObject(userInfo)
                        .environmentObject(vm))
                        .buttonStyle(CustomButtonStyle(buttonType: .largeRounded))
                } else {
                    Button(action: {
                        print(vm.user.isEmpty)
                        dismiss()
                    }, label: {
                        Text(buttonLabel.rawValue)
                    })
                    .buttonStyle(CustomButtonStyle(buttonType: .smallRounded))
                    .frame(width: 165, height: 35.71429, alignment: .center)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                }
            }
            
            Spacer(minLength: 77)
        }
        .padding(20)
    }
}

struct QuestionnairePage1_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage1(buttonLabel: .next)
    }
}
