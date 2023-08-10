//
//  CategoryButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct CategoryButton: View {
    
    @State var selectedButton: Bool
    @State var color: Color = .brandGray
    var image: Image
    var label: String
    
    var body: some View {
        VStack{
            Button {
                selectedButton = !selectedButton
                if selectedButton {
                    color = Color.brandGreen
                }
                else {
                    color = Color.brandGray
                }
            } label: {
                VStack{
                    if selectedButton {
                        ZStack{
                            image
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            Circle()
                                .stroke(color, lineWidth: 5)
                                .frame(width: 65, height: 65)
                        }
                    }
                    else{
                        image
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    }
                    Text(label)
                        .bold()
                        .foregroundColor(color)
                }
            }
            
        }
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(selectedButton: false, image: Image("ProfileDefault"), label: "label")
    }
}
