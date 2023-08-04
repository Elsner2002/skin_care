import Foundation
import SwiftUI

struct SecondaryButton: View {
    @Binding var isSelected: Bool
    var color: Color = .brandWhite
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
        .buttonSecondary(backgroundColor: color)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(isSelected: .constant(false), label: "Pele Normal", description: "texto sobre como a pele normal se categoriza linha linha linha linahakbf", action: {})
    }
}




