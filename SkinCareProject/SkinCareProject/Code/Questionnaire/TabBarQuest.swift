//
//  TabBarQuest.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import SwiftUI

struct TabBarQuest: View {
    
    @EnvironmentObject var vm: CloudKitModel
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        NavigationStack {
            QuestionnairePage1(buttonLabel: .next)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct TabBarQuest_Previews: PreviewProvider {
    static var previews: some View {
        TabBarQuest()
    }
}
