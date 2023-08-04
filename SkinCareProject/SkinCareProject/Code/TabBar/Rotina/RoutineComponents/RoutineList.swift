//
//  RoutineList.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct RoutineList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Meus produtos")
              .font(
                Font.custom("SF Pro", size: 20)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color.systemLabelPrimary)
        }
        .padding(.leading, 12)
        .padding(.trailing, 10)
        .padding(.top, 20)
        .padding(.bottom, 10)
        .frame(width: 377, alignment: .topLeading)
    }
}

struct RoutineList_Previews: PreviewProvider {
    static var previews: some View {
        RoutineList()
    }
}
