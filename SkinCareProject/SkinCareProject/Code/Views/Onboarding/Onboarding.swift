//
//  Onboarding.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct Onboarding: View, Hashable {
    var image: String
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack{
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 398, height: 336)
            }
            .frame(height: 350)
            
            VStack{
                Text(title)
                    .font(.custom("Quicksand-Bold", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(3)
                Text(subtitle)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 290)
                Spacer()
            }
        }
    }
}
    
    struct Onboarding_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding(image: "heart", title: "title", subtitle: "subtitle")
        }
    }
