//
//  RecipePlaceholderView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 4/3/23.
//

import SwiftUI

struct RecipePlaceholderView: View {
    @EnvironmentObject var forkifyStore: ForkifyStore
    
    var body: some View {
        VStack {
            Spacer()
            
            if forkifyStore.isLoading {
                LoaderView()
            } else {
                Text("There was an issue loading the recipe.")
                    .roundedFont(size: 20)
                    .foregroundColor(K.Colors.grayDark1)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
            }
            
            Spacer()
        }
    }
}

struct RecipePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        RecipePlaceholderView()
            .environmentObject(ForkifyStore())
    }
}
