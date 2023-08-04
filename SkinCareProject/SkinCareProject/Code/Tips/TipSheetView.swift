//
//  TipSheetView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct TipSheetView: View {
    
    var tip: Tip
    
    var body: some View {
        VStack {
            Text(tip.title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
            Image(tip.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 312, height: 169)
                .clipped()
            HStack{
                Text(tip.text)
                    .foregroundColor(Color.brandGray)
            }
            .padding()
        }
        .presentationDetents([.medium])
    }
}

struct TipSheetView_Previews: PreviewProvider {
    static var previews: some View {
        TipSheetView(tip: Tip(title: "a", text: "b", image: "ProfileDefault"))
    }
}
