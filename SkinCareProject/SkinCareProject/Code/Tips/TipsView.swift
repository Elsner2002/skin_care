//
//  TipsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 24/07/23.
//

import SwiftUI

struct TipsView: View {
    
    @State private var showSheet = false
    var tip: Tip
    
    var body: some View {
            Button {
                showSheet.toggle()
            } label: {
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 312, height: 169)
                        .background(
                            Image(tip.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 312, height: 169)
                                .clipped()
                    )
                    .cornerRadius(15)
                    HStack{
                        Text("Saiba mais")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.leading, 40)
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                TipSheetView(tip: tip)
            }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(tip: Tip(title: "a", text: "b", image: "ProfileDefault"))
    }
}
