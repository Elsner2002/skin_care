//
//  RoutineButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct RoutineButton: View {
    
    var image: Image
    var color: Color
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .frame(width: 124, height: 124)
                .foregroundColor(color)
                .padding(.vertical, 10)
        }
        .padding(8.36378)
        .frame(width: 154, height: 143, alignment: .center)
        .background(Color.systemMaterialSecondary)
        .cornerRadius(12.54566)
        .shadow(color: Color.systemLabelTerciary.opacity(0.07), radius: 0, x: 4, y: 4)
    }
}

struct RoutineButton_Previews: PreviewProvider {
    static var previews: some View {
        RoutineButton(image: Image("ProfileDefault"), color: Color.red)
    }
}
