//
//  DirectionsLinkView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct DirectionsLinkView: View {
    let publisher: String
    let sourceUrl: URL
    
    private var howToCookMessage: AttributedString? {
        var message: AttributedString?
        
        do {
            message = try AttributedString(
                markdown: "This recipe was carefully designed and tested by **\(publisher)**. Please check out directions at their website.")
        } catch {
            print("Couldn't parse: \(error)")
        }
        
        return message
    }
    
    var body: some View {
        VStack {
            Text("How to cook it".uppercased())
                .bold()
                .foregroundColor(.accentColor)
                .roundedFont(size: 20)
                .padding(.top)
                .padding(.bottom, 10)
            
            if let message = howToCookMessage {
                Text(message)
                    .foregroundColor(K.Colors.grayDark1)
                    .roundedFont()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
            }
            
            Link(destination: sourceUrl) {
                HStack {
                    Text("Directions".uppercased())
                        .fontWeight(.semibold)
                        .roundedFont()
                    
                    IconView(icon: .arrowRight)
                        .fontWeight(.semibold)
                        .frame(width: 20)
                }
                .foregroundColor(K.Colors.grayLight1)
                .padding(.vertical)
                .padding(.horizontal, 30)
                .background(K.Colors.gradient)
                .clipShape(Capsule())
            }
        }
    }
}

struct DirectionsLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsLinkView(publisher: testRecipe.publisher, sourceUrl: testRecipe.sourceURL!)
    }
}
