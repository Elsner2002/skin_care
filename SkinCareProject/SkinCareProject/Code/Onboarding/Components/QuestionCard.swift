//
//  Components.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct QuestionCard<T: RawRepresentable & CaseIterable & Hashable>: View where T.AllCases : RandomAccessCollection, T.RawValue == String { // accepts any enum as T
    
    @State var buttonPressed: String = ""
    var questionLabel: String
    var buttonLabels: T.Type
    var button: ButtonType
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 21) {
                Text(questionLabel)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 33))
                
                //For each will control how many buttons a screen needs based on the enum cases
                ForEach(buttonLabels.allCases, id: \.self) { label in
                    PrimaryButton(label: label.rawValue , description: "implement this", action: {
                        self.buttonPressed = label.rawValue
                    }, isPressed: buttonPressed == label.rawValue)
                }
            }
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCard(questionLabel: "pergunta", buttonLabels: Gender.self, button: ButtonType.primary)
    }
}
