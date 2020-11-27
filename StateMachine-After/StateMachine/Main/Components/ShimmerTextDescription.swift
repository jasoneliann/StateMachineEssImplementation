//
//  ShimmerTextDescription.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct ShimmerTextDescription: View {
    
    let state: ShimmerType
    let text: String
    
    var body: some View {
        switch state {
        
        case .start:
            ShimmerView(size: CGSize(width: 200, height: 50))
            
        case .stop:
            Text(text)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
    }
}

struct ShimmerTextDescription_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerTextDescription(state: .stop, text: "Hello")
    }
}
