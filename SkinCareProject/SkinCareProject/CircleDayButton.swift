//
//  CircleDayButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct CircleDayButton: View {
    
    var dayString: String
    @State var selectedButton: Bool
    
    var body: some View {
        Button {
            selectedButton = !selectedButton
        } label: {
            ZStack{
                if selectedButton {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40)
                }
                else{
                    Circle()
                        .stroke()
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                }
                
                Text(dayString)
                    .foregroundColor(.black)
            }
        }
    }
}

struct CircleDayButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleDayButton(dayString: "S", selectedButton: true)
    }
}
