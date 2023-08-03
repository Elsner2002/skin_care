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
            TipsView(tip: Constants.shared.randomTip!)
        } .onAppear{
            UserDefaults.standard.set(false, forKey: "firstTimeHere")
          }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
          
    }
}
