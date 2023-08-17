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
                        .frame(width: 349, height: 189)
                        .background(
                            Image(tip.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 349, height: 189)
                                .clipped()
                        )
                        .cornerRadius(15)
                }
            }
            .sheet(isPresented: $showSheet) {
                TipSheetView(tip: tip)
                    .presentationDragIndicator(.visible)
            }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(tip: Tip(title: "Title", text: "blablablabla", image: "gato-cinza", subtitle: "subtitle", type: "Type"))
    }
}
