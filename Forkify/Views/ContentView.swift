//
//  ContentView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var forkifyStore: ForkifyStore
    
    // MARK: - Content
    var body: some View {
        VStack {
            // MARK: - Top section
            TopBarView()
                .padding(.horizontal)
                .padding(.bottom)
            
            // MARK: - Search section
            SearchView()
                .padding()
            
            // TODO: Add center modifer for Spacers
            // MARK: - Results section
            if forkifyStore.isLoading {
                Spacer()
                LoaderView()
                Spacer()
            } else {
                if forkifyStore.recipes.isEmpty {
                    Spacer()
                    Text("Start by searching for a recipe or an ingredient. Have fun!")
                        .roundedFont(size: 20)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                    IconView(icon: .smiley)
                        .frame(width: 60)
                        .foregroundColor(.accentColor)
                    Spacer()
                } else {
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(forkifyStore.recipes, id: \.id) { recipe in
                                RecipeTileView(recipe: recipe)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
            
            Spacer()
        }
        .background(K.Colors.grayLight1.ignoresSafeArea())
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ForkifyStore())
    }
}
