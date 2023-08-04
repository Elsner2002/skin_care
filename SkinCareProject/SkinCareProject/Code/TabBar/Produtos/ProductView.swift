//
//  ProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 26/07/23.
//

import SwiftUI

struct ProductView: View {
    
    @Binding var path: [Int]
    let count: Int
    var barcode: String
    
    var body: some View {
        VStack {
            Text(barcode)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    path = []
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
                
            }
        }
    }
}
