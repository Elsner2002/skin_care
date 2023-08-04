import Foundation
import SwiftUI

struct PrimaryButton: View {
    var label: String
    var description: String
    var action: () -> Void
    
    var isPressed: Bool = false
    
    var body: some View {
        Button {
            self.action()
        } label: {
            Text(label)
                .frame(maxWidth: .infinity)
        }
        .buttonPrimary(backgroundColor: self.isPressed ? .brandGreen : .buttonColor)
    }
}

