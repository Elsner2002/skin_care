//
//  ListTitle.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct ListTitle: View {
    let category: String
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .center) {
                Text(category)
                    .font(Font.custom("SF Pro", size: 16))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.systemLabelPrimary)
                Spacer()
                Button {
                    showSheet.toggle()
                } label: {
                    Text("+ Adicionar")
                        .font(
                            Font.custom("SF Pro Text", size: 16.4052)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.brandGreen)
                }
                .fullScreenCover(isPresented: $showSheet) {
                    AddProductView()
                }
            }
            .frame(width: 362, alignment: .leading)
            
        }
    }
}

struct ListTitle_Previews: PreviewProvider {
    static var previews: some View {
        ListTitle(category: "Tônicos & Tratamentos")
    }
}
