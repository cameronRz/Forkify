//
//  ServingControls.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct ServingControls: View {
    var onIncrease: () -> Void
    var onDecrease: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                onDecrease()
            } label: {
                IconView(icon: .minus)
                    .frame(width: 20)
                    .fontWeight(.semibold)
            }
            
            Button {
                onIncrease()
            } label: {
                IconView(icon: .plus)
                    .frame(width: 20)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct ServingControls_Previews: PreviewProvider {
    static var previews: some View {
        ServingControls {
            //
        } onDecrease: {
            //
        }
    }
}
