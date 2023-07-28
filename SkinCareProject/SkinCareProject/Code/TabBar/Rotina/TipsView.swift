//
//  TipsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 24/07/23.
//

import SwiftUI

struct TipsView: View {
    
    var title: String
    var text: String
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.gray)
                HStack{
                    Text(text)
                        .font(.title3)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(title: "Tip1", text: "Fazer skin care é legal")
    }
}
