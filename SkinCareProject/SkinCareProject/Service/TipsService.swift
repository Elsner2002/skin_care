//
//  TipsService.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI

final class TipsService: ObservableObject {
    @Published var tips = [Tip]()
    
    init(){
        loadData()
    }
        
    func loadData() {
        do{
            guard let url = Bundle.main.url(forResource: "TipsData", withExtension: "json") else {
                print("Json file not found")
                return
            }
            let data = try? Data(contentsOf: url)
//            let url = Bundle.main.url(forResource: "TipsData", withExtension: "json")!
//            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            self.tips = try decoder.decode([Tip].self, from: data!)
        }
        catch{
            self.tips = []
        }
    }
}
