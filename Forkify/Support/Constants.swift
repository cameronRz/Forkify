//
//  Constants.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct K {
    struct Colors {
        static let primary = Color("ColorPrimary")
        
        static let grayLight1 = Color("ColorGrayLight1")
        static let grayLight2 = Color("ColorGrayLight2")
        static let grayLight3 = Color("ColorGrayLight3")
        
        static let grayDark1 = Color("ColorGrayDark1")
        static let grayDark2 = Color("ColorGrayDark2")
        
        static let gradient1 = Color("ColorGradient1")
        static let gradient2 = Color("ColorGradient2")
        
        static let gradient = LinearGradient(
            gradient: Gradient(colors: [gradient1, gradient2]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }
}
