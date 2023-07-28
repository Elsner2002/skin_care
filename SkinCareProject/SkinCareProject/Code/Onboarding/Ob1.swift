//
//  Ob1.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct Ob1: View {
    var body: some View {
        VStack{
            HStack {
                Spacer()
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                    Text("Pular")
                        .font(.system(size: 20))
                        .foregroundColor(Color(uiColor: .lightGray))
                }).padding(25)
            }
            VStack{
                VStack{
                    Image("")
                        .resizable()
                        .frame(width: 398, height: 336)
                }
                .frame(height: 350)
                
                VStack{
                    Text("Onboarding 1")
                        .font(.custom("Quicksand-Bold", size: 34))
                        .multilineTextAlignment(.center)
                        .padding(3)
                    Text("onboarding-content-1")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 290)
                    Spacer()
                }
            }
        }
    }
}

struct Ob1_Previews: PreviewProvider {
    static var previews: some View {
        Ob1()
    }
}
