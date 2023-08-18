//
//  RectangleCategoryButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct RectangleCategoryButton: View {
    
    var categoryString: String = "Hidratante"
    @Binding var selected: String
    
    var body: some View {
        Button {
        } label: {
            ZStack{
                if self.selected == categoryString {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .foregroundColor(Color.systemButton)
                            .frame(width: 175, height: 73)
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .foregroundColor(Color.systemButton)
                            .frame(width: 175, height: 73)
                        Text(categoryString)
                            .foregroundColor(Color.systemLabelPrimary)
                    } .onTapGesture {
                        self.selected = ""
                    }
                }  else{
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .foregroundColor(Color.systemMaterialSecondary)
                            .frame(width: 175, height: 73)
                        Text(categoryString)
                            .foregroundColor(Color.systemLabelPrimary)
                    } .onTapGesture {
                        self.selected = categoryString
                    }
                }
            }
            
        }
    }
}

struct RectangleCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCategoryButton(categoryString: "Hidratante", selected: .constant("Hidratante"))
    }
}
