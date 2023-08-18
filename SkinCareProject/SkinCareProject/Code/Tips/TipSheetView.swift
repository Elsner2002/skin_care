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
        ScrollView(showsIndicators: false) {
            VStack {
                Text(tip.type)
                    .font(
                        Font.custom("SF Pro", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.systemLabelPrimary)
                    .padding(.top, 14)
                    .padding(.bottom, 40)
                
                Text(tip.title)
                    .font(
                        Font.custom("SF Pro", size: 22)
                            .weight(.bold)
                    )
                    .foregroundColor(Color.systemLabelPrimary)
                    .frame(width: 327, alignment: .topLeading)
                    .padding([.bottom, .horizontal], 20)
                
                Image(tip.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 326, height: 156)
                    .clipped()
                    .cornerRadius(12, corners: .allCorners)
                    .padding(.horizontal, 30)
                
                Text(tip.subtitle)
                    .font(
                        Font.custom("SF Pro", size: 18)
                            .weight(.regular)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.systemLabelSecondary)
                    .frame(width: 327, alignment: .top)
                
                
                Text(tip.text)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(Font.custom("SF Pro", size: 15))
                    .foregroundColor(Color.systemLabelPrimary)
                    .frame(width: 327, height: 136, alignment: .topLeading)
                    .padding(.vertical, 20)
            }
            
        }
        .presentationDetents([.large])
    }
}

struct TipSheetView_Previews: PreviewProvider {
    static var previews: some View {
        TipSheetView(tip: Tip(title: "Title", text: "blablablabla", image: "gato-cinza", subtitle: "subtitle", type: "Type"))
    }
}
