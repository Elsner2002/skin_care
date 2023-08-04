//
//  ListDescription.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct ListDescription: View {
    let description: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 1, height: 71)
              .background(Color.systemButton)
            Text(description)
              .font(Font.custom("SF Pro", size: 15))
              .foregroundColor(Color.systemLabelPrimary)
              .frame(width: 347, alignment: .topLeading)
        }
        .padding(.leading, 3)
        .padding(.trailing, 0)
        .padding(.vertical, 0)
        .frame(width: 362, alignment: .leading)
    }
}

struct ListDescription_Previews: PreviewProvider {
    static var previews: some View {
        ListDescription(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas")
    }
}
