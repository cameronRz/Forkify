//
//  Extensions.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

// MARK: - View Extensions
extension View {
    func roundedFont(size: CGFloat? = nil) -> some View {
        self.font(.system(size: size ?? 17, design: .rounded))
    }
    
    func centerHorizontal() -> some View {
        self.modifier(CenterHorizontalModifier())
    }
    
    func centerVertical() -> some View {
        self.modifier(CenterVerticalModifier())
    }
}

// MARK: - Hide keyboard
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
