//
//  Components.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 14/08/23.
//

import SwiftUI

struct QuestionCardMultipleChoice<T: RawRepresentable & CaseIterable & Hashable>: View where T.AllCases : RandomAccessCollection, T.RawValue == String { // accepts any enum as T
    
    @Binding var buttonPressed: Set<String>
    @State var showDescription: Bool = false
    var buttonType: ButtonType
    var questionLabel: String
    var buttonLabels: T.Type
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 18) {
                Text(questionLabel)
                    .multilineTextAlignment(.leading)
                    .frame(height: 48)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 33))
                ForEach(buttonLabels.allCases, id: \.self) { label in
                    PrimaryButton(
                        label: label.rawValue,
                        description: "implement this",
                        isPressed: buttonPressed.contains(label.rawValue))
                    {if (buttonPressed.contains(label.rawValue)) {
                        buttonPressed.remove(label.rawValue)
                    } else {
                        buttonPressed.insert(label.rawValue)}
                    }
                }
            }
        }
    }
}