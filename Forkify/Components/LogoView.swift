//
//  LogoView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Text("forkify")
                .font(Font.custom("Pacifico-Regular", size: 50))
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
