//
//  CategoryButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct CategoryButton: View {
    
    let selectedButton: Bool
    var image: Image
    var label: String
    var buttonAction: () -> Void
    
    var color: Color {
        selectedButton ? Color.brandGreen : Color.brandGray
    }
    
    var body: some View {
        VStack{
            Button {
                buttonAction()
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
        CategoryButton(selectedButton: false, image: Image("ProfileDefault"), label: "label"){}
    }
}
