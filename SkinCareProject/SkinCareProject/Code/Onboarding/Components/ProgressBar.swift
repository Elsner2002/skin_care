//
//  ProgressBar.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double
    
    var body: some View {
    
        ProgressView("", value: progress, total: 100)
            .tint(.brandGreen)
            .frame(width: 243, height: 44, alignment: .center)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 20.0)
    }
}
