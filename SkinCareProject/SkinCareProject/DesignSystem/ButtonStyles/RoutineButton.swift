//
//  RoutineButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct RoutineButton: View {
    
    var image: Image
    
    var body: some View {
        HStack{
            image
                .resizable()
                .frame(width: 104, height: 104)
                .clipShape(Circle())
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.brandWhite)
                .shadow(
                    color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                )
        )
        .padding([.leading, .trailing])
    }
}

struct RoutineButton_Previews: PreviewProvider {
    static var previews: some View {
        RoutineButton(image: Image("ProfileDefault"))
    }
}
