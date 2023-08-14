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

struct QuestionnairePage2: View, Hashable {
    
    var body: some View {
        VStack {
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 80, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            QuestionCard(buttonType: .smallRounded, questionLabel: "CQual seu tipo de pele?", buttonLabels: SkinType.self)
                .frame(width: 334, alignment: .topLeading)
            HStack {
                NavigationLink("Próximo", destination: QuestionnairePage3())
                    .buttonStyle(CustomButtonStyle(buttonType: .largeRounded))
            }
                .frame(width: 162.14287, alignment: .center)
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
            Spacer(minLength: 70)

        }
        .padding(20)
    }
}
struct QuestionnairePage2_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage2()
    }
}
