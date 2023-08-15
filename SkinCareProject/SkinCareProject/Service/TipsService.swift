//
//  TipsService.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI

final class TipsService: ObservableObject {
    private var tips: [Tip]
    
    init(){
        do {
            let mockDataUrl = Bundle.main.url(forResource: "TipsData", withExtension: "json")!
            let data = try Data(contentsOf: mockDataUrl)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            self.tips = try decoder.decode([Tip].self, from: data)
        } catch {
            self.tips = []
        }
    }
    
    func getTips() -> [Tip] {
        return tips
    }
}
