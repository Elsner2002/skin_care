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
        HStack{
            image
                .resizable()
                .frame(width: 124, height: 124)
                .foregroundColor(color)
                .padding(.vertical, 10)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.systemMaterialSecondary)
                .shadow(
                    color: Color.black.opacity(0.07), radius: 0, x: 4, y: 4
                )
        )
        .padding(.horizontal)
    }
}

struct RoutineButton_Previews: PreviewProvider {
    static var previews: some View {
        RoutineButton(image: Image("ProfileDefault"), color: Color.red)
    }
}
