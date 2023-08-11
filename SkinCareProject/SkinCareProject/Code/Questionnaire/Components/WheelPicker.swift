//  WheelPicker.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 02/08/23.
//

import SwiftUI

struct WheelPicker: View {
    @State var selected: Int = 18
    var questionLabel: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(questionLabel)
                .padding(EdgeInsets(top: 51, leading: 0, bottom: 30, trailing: 33))
            
            Picker("", selection: $selected) {
                ForEach(12...100, id: \.self) { index in
                    Text("\(index)")
                        .font(.body)

                }
            }
            .pickerStyle(.wheel)
            .scaleEffect(1.5)
        }
    }
}

struct WheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        WheelPicker(questionLabel: "Qual seu genero?")
    }
}




