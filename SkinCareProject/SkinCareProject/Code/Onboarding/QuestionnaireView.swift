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
            Text("Qual seu gênero?")
                .font(.system(size: 17))
            
            SingleSelectionButton(buttonLabel: "Queima facilmente, não bronzeia")
            SingleSelectionButton(buttonLabel: "Queima facilmente, bronzeia pouco")
            
        }
        
       
    }
}

struct Questionnaire_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView()
    }
}
