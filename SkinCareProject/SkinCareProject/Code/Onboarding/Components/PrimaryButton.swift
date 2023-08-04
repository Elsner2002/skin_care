//
//  PrimaryButton.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 02/08/23.

import Foundation
import SwiftUI

struct PrimaryButton: View {
    
    var label: String
    var description: String
    var action: () -> Void
    
    var isPressed: Bool = false
    
    var body: some View {
        Button {
            //self.isPressed.toggle()
            self.action()
           // self.isPressed = false
        } label: {
            Text(label)
                .frame(maxWidth: .infinity)
        }
        .buttonPrimary(backgroundColor: self.isPressed ? .brandGreen : .brandGray)
    }
}

