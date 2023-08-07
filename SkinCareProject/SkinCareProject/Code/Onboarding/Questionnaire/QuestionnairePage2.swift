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
        
        VStack(spacing: 42) {
            ProgressView("", value: 20, total: 100)
                .tint(.systemButton)
                .frame(width: 243, height: 44, alignment: .center)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 51, trailing: 0))
            
            QuestionCard(questionLabel: "Qual seu tipo de pele?", buttonLabels: SkinType.self)
            HStack {
                NavigationLink(destination: QuestionnairePage3(), label: { Text("Próximo") })
            }
            
//            TerciaryButton(label: "Próximo", description: "implement this", action: {})
//
//            .frame(width: 165, height: 35.71429, alignment: .topLeading)
//            .padding(EdgeInsets(top: 100, leading: 0, bottom: 77, trailing: 0))
        
            Spacer()
        }
        .padding(60)
    }
}
struct QuestionnairePage2_Preview: PreviewProvider {
    static var previews: some View {
        QuestionnairePage2()
    }
}
