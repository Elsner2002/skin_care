//
//  CategoryButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct CategoryButton: View {
    
    @State var selectedButton: Bool
    var image: Image
    var label: String
    
    var body: some View {
        VStack{
            Button {
                selectedButton = !selectedButton
            } label: {
                VStack{
                    if selectedButton{
                        ZStack{
                            image
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            Circle()
                                .stroke(Color.brandGreen, lineWidth: 5)
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
                        .foregroundColor(Color.black)
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
