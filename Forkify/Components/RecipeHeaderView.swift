//
//  RecipeHeaderView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct RecipeHeaderView: View {
    var imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            ZStack {
                image
                    .resizable()
                    .scaledToFill()
                
                K.Colors.gradient.opacity(0.4)
            }
        } placeholder: {
            ZStack {
                K.Colors.gradient.opacity(0.4)
                
                IconView(icon: .logo)
                    .frame(height: 150)
                    .foregroundColor(.white)
            }
        }
        .frame(idealWidth: 300, maxHeight: 300)
    }
}

struct RecipeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHeaderView()
    }
}
