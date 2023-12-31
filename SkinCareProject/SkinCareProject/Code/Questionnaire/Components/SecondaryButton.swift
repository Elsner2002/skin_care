import Foundation
import SwiftUI

struct SecondaryButton: View {
    var label: String
    var description: String
    var isPressed: Bool = false
    var action: () -> Void


    var body: some View {
        VStack {
            Button {
                self.action()
            } label: {
                Text(label)
                    .frame(maxWidth: .infinity)
            }
            .buttonPrimary(backgroundColor: self.isPressed ? .brandGreen : .buttonColor)
            
            if isPressed && description != "" {
                TextDescriptions(description: description)
            }
        }
    }
}
