//
//  SingleSelectionButton.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 31/07/23.
//

import SwiftUI

struct SingleSelectionButton: View {
    var buttonLabel: String
    
    var body: some View {
        Button(action: {
                    // Add your button action here
                    print("Button tapped")
                }) {
                    Text(buttonLabel)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Color.blue)
                        .cornerRadius(12)
                    
                }
                .frame(width: 324, alignment: .center)
    }
}

struct SingleSelectionButton_Previews: PreviewProvider {
    static var previews: some View {
        SingleSelectionButton(buttonLabel: "Queima facilmente, não bronzeia")
    }
}
