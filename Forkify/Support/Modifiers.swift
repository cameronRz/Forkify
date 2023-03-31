//
//  Modifiers.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

// MARK: - Center Horizontal Modifier
struct CenterHorizontalModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

// MARK: - Center Vertical Modifier
struct CenterVerticalModifier: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            Spacer()
            content
            Spacer()
        }
    }
}
