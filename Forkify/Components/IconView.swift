//
//  IconView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct IconView: View {
    let icon: ForkifyIcons
    
    var body: some View {
        Image(systemName: icon.rawValue)
            .resizable()
            .scaledToFit()
    }
}

// MARK: - Icons enum
enum ForkifyIcons: String {
    case logo = "fork.knife"
    case smiley = "face.smiling"
    case bookmarks = "bookmark"
    case search = "magnifyingglass"
    case paginationLeft = "arrow.left"
    case paginationRight = "arrow.right"
    case clock = "clock"
    case people = "person.2"
    case plus = "plus.circle"
    case minus = "minus.circle"
    case checkmark = "checkmark"
}

// MARK: - Preview
struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(icon: .smiley)
    }
}
