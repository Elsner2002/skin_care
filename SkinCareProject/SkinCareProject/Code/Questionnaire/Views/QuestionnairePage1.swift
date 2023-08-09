//
//  QuestionnairePage1.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI

struct QuestionnairePage1: View, Hashable {
    var body: some View {
        VStack {
            ProgressBar(progress: 10.0)
            QuestionCard(buttonType: .largeRounded,questionLabel: "Qual seu gênero?",buttonLabels: Gender.self)
            WheelPicker(questionLabel: "Qual sua idade?")
                .frame(height: 220)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 51, trailing: 0))
            HStack(alignment: .center){
                NavigationLink(destination: HomeView(),
                           label: { CustomButton(label: "Responder Depois", action: {print("to aqui1")}, description: "", buttonType: .smallRounded) })
         
                NavigationLink(destination: QuestionnairePage2(),
                           label: { CustomButton(label: "Próximo", action: {print("to aqui")}, description: "", buttonType: .largeRounded) })
            }
            Spacer(minLength: 77)
        }
        .padding(20)
    }
}


struct QuestionnairePage1_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage1()
    }
}