//
//  GraphicPicker.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 07/08/23.
//

import SwiftUI

struct GraphicPicker: View {
    @Binding var selectedDate: Date
    var body: some View {
        DatePicker("", selection: $selectedDate)
            .datePickerStyle(GraphicalDatePickerStyle())
            .background(Color.brandMint)
            .cornerRadius(11.64)
            .frame(width: 350.4422, height: 386.36011, alignment: .topLeading)
    }
}

struct GraphicPicker_Previews: PreviewProvider {
    static var previews: some View {
        GraphicPicker(selectedDate: .constant(Date.now))
    }
}
