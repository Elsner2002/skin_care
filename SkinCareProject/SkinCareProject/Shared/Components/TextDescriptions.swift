//
//  ListDescription.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct TextDescriptions: View {
    var description: String
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 1, height: 71)
                .background(Color.systemButton)
            Text(description)
            Spacer()
        }
    }
}

struct TextSescriptions_Previews: PreviewProvider {
    static var previews: some View {
        ListDescription(description: "descrição aqui")
    }
}

