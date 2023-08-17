//
//  Components.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

typealias RawHashIterableStringConvertible = RawRepresentable & CaseIterable & Hashable & CustomStringConvertible

struct QuestionCard<T: RawHashIterableStringConvertible>: View where T.AllCases : RandomAccessCollection, T.RawValue == String { // accepts any enum as T
    
    @Binding var buttonPressed: String
    @State var showDescription: Bool = false
    var buttonType: ButtonType
    var questionLabel: String
    var buttonLabels: T.Type
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 18) {
                HStack(alignment: .center) {
                    Image("QuestionnaireSymbol")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    Text(questionLabel)
                        .multilineTextAlignment(.leading)
                        .frame(height: 48)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 33))
                }
                ForEach(buttonLabels.allCases, id: \.self) { label in
                    PrimaryButton(
                        label: label.rawValue,
                        description: label.description,
                        isPressed: buttonPressed == label.rawValue)
                    {self.buttonPressed = label.rawValue}
                }
            }
        }
    }
}

