//
//  Classes.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI

class User {
    var name: String
    var phototype: Phototype
    var skinType: SkinType
    var profileImage: Image
    
    init(name: String, phototype: Phototype, skinType: SkinType, profileImage: Image) {
        self.name = name
        self.phototype = phototype
        self.skinType = skinType
        self.profileImage = profileImage
    }
}

class Products {
    
}
