//
//  IconDetailView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct IconDetailView: View {
    let icon: ForkifyIcons
    let descriptor: String
    var highlight: String
    
    var body: some View {
        HStack {
            IconView(icon: icon)
                .foregroundColor(.accentColor)
                .frame(width: 25)
                .bold()
            
            HStack(spacing: 2) {
                Text(highlight)
                    .fontWeight(.semibold)
                    .foregroundColor(K.Colors.grayDark1)
                    .roundedFont()
                
                Text(descriptor)
                    .foregroundColor(K.Colors.grayDark1)
                    .roundedFont()
            }
        }
    }
}

struct IconDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IconDetailView(icon: .people, descriptor: "Servings", highlight: "4")
    }
}
