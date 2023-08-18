//
//  RoutineProgressBar.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 01/08/23.
//

import SwiftUI

struct RoutineProgressBar: View {
    var total: CGFloat = 293.45142 // width
    var lineHeight: CGFloat = 19.02 // height
    var progress: CGFloat = 0
    var totalProgress: CGFloat = 0

    
    var body: some View {
        
        let multiplier = total / totalProgress
        
        ZStack(alignment: .leading) {
            Rectangle ()
                .foregroundColor(.clear)
                .position(x:161, y:10)
                .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                .cornerRadius(10)
                .frame(width: total, height: lineHeight)
            
            HStack {
                if progress == 0 {
                    Circle()
                        .foregroundColor(Color.brandGreen)
                        .frame(width: 14, height: 14)
                        .offset(x: 2)
                }
                else if progress == totalProgress {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color.brandGreen)
                        .cornerRadius(10)
                        .frame(width: ((progress * multiplier) - 4) , height: 14)
                        .offset(x: 2)
                }
                else {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color.brandGreen)
                        .cornerRadius(10)
                        .frame(width: progress * multiplier, height: 14)
                        .offset(x: 2)
                }
            }
            .foregroundColor (.clear)
        }
    }
}

struct RoutineProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        RoutineProgressBar(progress: 2, totalProgress: 7)
    }
}
