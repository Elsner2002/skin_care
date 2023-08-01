//
//  RectangleCategoryButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct RectangleCategoryButton: View {
    
    var categoryString: String
    @State var selectedButton: Bool
    
    var body: some View {
        Button {
            selectedButton = !selectedButton
        } label: {
            ZStack{
                if selectedButton {
                    RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                        .foregroundColor(.blue)
                        .frame(width: 175, height: 73)
                }
                else{
                    RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                        .stroke()
                        .foregroundColor(.black)
                        .frame(width: 175, height: 73)
                }
                
                Text(categoryString)
                    .foregroundColor(.black)
            }
        }
    }
}

struct RectangleCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCategoryButton(categoryString: "Hidratante", selectedButton: true)
    }
}
