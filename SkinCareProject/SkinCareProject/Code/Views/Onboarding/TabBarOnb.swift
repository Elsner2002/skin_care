//
//  TabBarOnb.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct TabBarOnb: View {
    var body: some View {
        NavigationStack{
            TabView {
                Ob1()
                Ob2()
                Ob3()
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarOnb_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOnb()
    }
}
