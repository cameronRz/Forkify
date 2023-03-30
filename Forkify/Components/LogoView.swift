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
            ZStack {
                Circle().fill(K.Colors.gradient)
                
                IconView(icon: .logo)
                    .padding()
                    .foregroundColor(.white)
            }
            
            Text("forkify")
                .font(Font.custom("Pacifico-Regular", size: 40))
                .foregroundColor(K.Colors.grayDark1)
        }
        .frame(height: 70)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
