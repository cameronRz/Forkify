//
//  BookmarkButton.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct BookmarkButton: View {
    var body: some View {
        Button {
            // Add bookmark
        } label: {
            ZStack {
                Circle()
                    .fill(K.Colors.gradient)
                
                IconView(icon: .bookmarks)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 15)
            }
            .frame(width: 50)
        }
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton()
    }
}
