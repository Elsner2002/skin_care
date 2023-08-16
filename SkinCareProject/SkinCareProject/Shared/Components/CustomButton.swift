//
//  CustomButton.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var description: String
    var isPressed: Bool = false
    var buttonType: ButtonType
    var action: () -> Void
    
    var body: some View {
        Button {
            self.action()
        } label: {
            Text(label)
                .frame(maxWidth: buttonType.frame ? .infinity : nil)
        }
        .customButtonStyle(buttonType: buttonType)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label: "Label", description: "This is a button description text.", buttonType: .largeRounded, action: {})
    }
}


