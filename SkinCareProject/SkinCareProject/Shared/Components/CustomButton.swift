//
//  CustomButton.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var action: () -> Void
    var description: String
    
    var isPressed: Bool = false
    
    var body: some View {
            Button {
                self.action()
            } label: {
                Text(label)
                    .frame(maxWidth: .infinity)
            }
            .customButtonStyle(buttonType: .largeRounded)
    

        }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label: "Label", action: {}, description: "This is a button description text.")
    }
}
