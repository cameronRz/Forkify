//
//  RecipeTitleView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct RecipeTitleView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title.uppercased())
                .multilineTextAlignment(.center)
                .roundedFont(size: 20)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .centerHorizontal()
            
        }
        .background(
            K.Colors.gradient.ignoresSafeArea()
        )
    }
}

struct RecipeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTitleView(title: "Cauliflower Pizza Crust (with BBQ Chicken Pizza)")
    }
}
