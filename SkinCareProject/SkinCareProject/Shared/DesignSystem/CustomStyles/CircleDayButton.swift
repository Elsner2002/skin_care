//
//  CircleDayButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct CircleDayButton: View {
    
    var dayString: String
    @State var selectedButton: Bool = false
    var frequencyDescription: Int = 0
    @Binding var frequency: [Int]
    
    var body: some View {
        Button {
        } label: {
            ZStack{
                if selectedButton {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.systemButton)
                            .frame(width: 40, height: 40)
                        Circle()
                            .stroke()
                            .foregroundColor(Color.systemLabelPrimary)
                            .frame(width: 40, height: 40)
                    } .onTapGesture {
                        if let index = frequency.firstIndex(of: frequencyDescription) {
                            frequency.remove(at: index)
                            self.selectedButton = false
                        }
                    }
                }
                else {
                    ZStack {
                        Circle()
                            .stroke()
                            .foregroundColor(Color.systemLabelPrimary)
                            .frame(width: 40, height: 40)
                    }
                    .onTapGesture {
                        frequency.append(frequencyDescription)
                        self.selectedButton = true
                    }
                }
                
                Text(dayString)
                    .foregroundColor(Color.systemLabelPrimary)
            }
        }
    }
}

struct CircleDayButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleDayButton(dayString: "S", frequencyDescription: 1, frequency: .constant([]))
    }
}
