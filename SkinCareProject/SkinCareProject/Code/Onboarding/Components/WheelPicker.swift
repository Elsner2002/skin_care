//  WheelPicker.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 02/08/23.
//

import SwiftUI

struct WheelPicker: View {
    @State var selected: Int = 18
    
    var body: some View {
        VStack {
            Picker("", selection: $selected) {
                ForEach(12...100, id: \.self) { index in
                    Text("\(index)")
                        .font(.body)

                }
            }
            .pickerStyle(.wheel)
            .scaleEffect(1.5)
        }    }
}

struct WheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        WheelPicker()
    }
}



