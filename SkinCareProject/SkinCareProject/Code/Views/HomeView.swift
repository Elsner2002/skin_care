//
//  HomeView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack{
            Text("Home")
            TipsView(title: Constants.shared.randomTip!.title, text: Constants.shared.randomTip!.text)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
