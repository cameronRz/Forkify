//
//  LoaderView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack {
            ProgressView()
                .tint(K.Colors.grayDark1)
                .scaleEffect(1.3, anchor: .center)
        }
        .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
            .previewLayout(.sizeThatFits)
    }
}
