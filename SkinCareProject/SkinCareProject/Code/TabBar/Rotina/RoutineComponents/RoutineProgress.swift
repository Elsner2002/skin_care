//
//  RoutineProgress.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 01/08/23.
//

import SwiftUI

struct RoutineProgress: View {
    let title: String
    let completion: Int
    let totalProducts: Int
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 9.06){
                HStack {
                    if title == "Rotina Noturna" {
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .frame(width: 22.64286, height: 22.64286)
                            .foregroundColor(Color.brandGreen)
                    } else {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 22.64286, height: 22.64286)
                            .foregroundColor(Color.brandPink)
                    }
                    Text(title)
                        .font(
                            Font.custom("SF Pro", size: 18.11428)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color.systemLabelPrimary)
                }
                
                RoutineProgressBar(progress: CGFloat(completion), totalProgress: CGFloat(totalProducts))
                
            }
            .padding(9.05714)
        }
        .frame(width: 346, height: 76)
        .background(Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.3))
        .cornerRadius(18.11428)
    }
}

struct RoutineProgress_Previews: PreviewProvider {
    static var previews: some View {
        RoutineProgress(
            title: "Rotina Noturna",
            completion: 2,
            totalProducts: 5
        )
    }
}
