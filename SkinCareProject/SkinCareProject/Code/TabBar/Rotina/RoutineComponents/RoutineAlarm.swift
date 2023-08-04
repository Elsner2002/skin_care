//
//  RoutineAlarm.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 01/08/23.
//

import SwiftUI

struct RoutineAlarm: View {
    let title: String
    @State var time = Date()
    @State var isOn: Bool
    
    var body: some View {
        VStack(alignment: .leading,  spacing: 0) {
            Text("ADICIONAR ALARME NA ROTINA")
              .font(Font.custom("SF Pro", size: 13))
              .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
              .frame(maxWidth: .infinity, alignment: .topLeading)
              .padding()
            
            HStack(alignment: .center, spacing: 4) {
                Text(title)
                    .font(Font.custom("SF Pro", size: 17))
                    .foregroundColor(Color.systemLabelPrimary)
                    .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                HStack{
                    DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                        .accentColor(Color.brandGreen)
                        .foregroundColor(Color.systemButton)
                        .colorInvert()
                        .colorMultiply(Color.systemButton)
                    
                    Toggle("", isOn: $isOn)
                        .toggleStyle(SwitchToggleStyle(tint: (Color.brandGreen)))
                }
                .padding()
            }
            .padding(.leading, 16)
            .padding(.trailing, 0)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .leading)
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.horizontal, 0)
        .padding(.top, 0)
        .padding(.bottom, 18)
        .frame(width: 346, alignment: .topLeading)
    }
}

struct RoutineAlarm_Previews: PreviewProvider {
    static var previews: some View {
        RoutineAlarm(
            title: "Noite",
            time: Date.now,
            isOn: true
        )
    }
}

