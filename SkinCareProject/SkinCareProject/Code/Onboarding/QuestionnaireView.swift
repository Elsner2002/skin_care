//
//  Questionnaire.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 25/07/23.
//

import SwiftUI

struct QuestionnaireView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
//            Image("Elipse")
//                .padding(EdgeInsets(top: 75, leading: 54, bottom: 668, trailing: 235))
            
            
            Text("Qual seu gênero?")
                .font(.body)
                .padding(EdgeInsets(top: 13, leading: 33, bottom: 35, trailing: 33))
            
            

          
            
            
        }
        
       
    }
}

struct Questionnaire_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView()
    }
}
