//
//  ListTitle.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct ListTitle: View {
    let category: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(category)
              .font(Font.custom("SF Pro", size: 16))
              .multilineTextAlignment(.leading)
              .foregroundColor(Color.systemLabelPrimary)
            Spacer()
            Button {
                //add product
            } label: {
                Text("+ Adicionar")
                  .font(
                    Font.custom("SF Pro Text", size: 16.4052)
                      .weight(.semibold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color.brandGreen)
            }
        }
        .frame(width: 362, alignment: .leading)
    }
}

struct ListTitle_Previews: PreviewProvider {
    static var previews: some View {
        ListTitle(category: "Tônicos & Tratamentos")
    }
}
