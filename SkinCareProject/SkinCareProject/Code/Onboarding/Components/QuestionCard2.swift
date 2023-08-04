//
//  QuestionCard2.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct QuestionCard2<T: RawRepresentable & CaseIterable & Hashable>: View where T.AllCases : RandomAccessCollection, T.RawValue == String {
    var questionLabel: String
    var buttonLabels: T.Type
    var button: ButtonType
    @State private var isSelected = false
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 21) {
                Text(questionLabel)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 33))
                ForEach(buttonLabels.allCases, id: \.self) { label in
                    SecondaryButton(isSelected: $isSelected, label: "label", description: "description", action: {isSelected.toggle()})
                }
            }
        }
    }
}

struct QuestionCard2_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCard2(questionLabel: "hey", buttonLabels: Gender.self, button: .secondary)
    }
}
