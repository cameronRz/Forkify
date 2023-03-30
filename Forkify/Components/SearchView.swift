//
//  SearchView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

// TODO: Add center modifer for Spacers

struct SearchView: View {
    @EnvironmentObject var forkifyStore: ForkifyStore
    @State private var searchValue = ""
    
    var body: some View {
        VStack {
            VStack {
                TextField(text: $searchValue) {
                    Text("Search over 1,000,000 recipies...")
                        .foregroundColor(K.Colors.grayLight3)
                }
                .padding(.horizontal, 10)
                .foregroundColor(K.Colors.grayDark1)
                .roundedFont()
                    
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            
            Button {
                guard searchValue != "" else { return }
                
                forkifyStore.searchRecipes(withPhrase: searchValue)
                searchValue = ""
                hideKeyboard()
            } label: {
                HStack {
                    Spacer()
                    IconView(icon: .search)
                        .fontWeight(.semibold)
                        .frame(height: 20)
                    
                    Text("SEARCH")
                        .fontWeight(.semibold)
                        .roundedFont()
                    Spacer()
                }
                .padding()
                .background(K.Colors.gradient)
                .clipShape(Capsule())
                .foregroundColor(.white)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ForkifyStore())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
