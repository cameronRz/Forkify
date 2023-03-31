//
//  TopBarView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

// TODO: Add Bookmark sheet functionality
struct TopBarView: View {
    var body: some View {
        HStack {
            LogoView()
            
            Spacer()
            
            Button {
                //
            } label: {
                IconView(icon: .bookmarks)
                    .frame(height: 25)
                    .bold()
            }
            .padding(.horizontal)
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
