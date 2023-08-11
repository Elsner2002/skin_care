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
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 21) {
                Text(questionLabel)
                    .multilineTextAlignment(.leading)
                    .frame(height: 48)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 33))

                ForEach(buttonLabels.allCases, id: \.self) { label in
                    CustomButton(label: label.rawValue,
                                 action: { self.buttonPressed = label.rawValue},
                                 description: "implement this",
                                 isPressed: buttonPressed == label.rawValue,
                                 buttonType: .largeRounded)
                }
            }
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCard(questionLabel: "pergunta", buttonLabels: SkinType.self)
    }
}
