//
//  Components.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 14/08/23.
//

import SwiftUI

struct QuestionCardMultipleChoice<T: RawHashIterableStringConvertible>: View where T.AllCases : RandomAccessCollection, T.RawValue == String { // accepts any enum as T
    
    @Binding var buttonPressed: Set<String>
    @State var showDescription: Bool = false
    var questionLabel: String
    var buttonLabels: T.Type
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Image("QuestionnaireSymbol")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    Text(questionLabel)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                }

                ScrollView {
                    ForEach(buttonLabels.allCases, id: \.self) { label in
                        SecondaryButton(
                            label: label.rawValue,
                            description: label.description,
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
}
