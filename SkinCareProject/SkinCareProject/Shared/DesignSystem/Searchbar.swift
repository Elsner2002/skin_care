//
//  Searchbar.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct Searchbar: View {
    
    @Binding var searchText: String
    var textPlaceHolder: String = ""

    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.brandGray)
            TextField(textPlaceHolder, text: $searchText)
                .foregroundColor(Color.brandGray)
                //.disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding([.bottom, .leading, .top])
                        .offset(x: 10)
                        .foregroundColor(Color.brandGray)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brandWhite)
                .shadow(
                    color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                )
        )
        .padding()
    }
}

struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar(searchText: .constant(""), textPlaceHolder: "Busque produtos")
    }
}