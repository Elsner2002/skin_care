//
//  ViewExtension.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
