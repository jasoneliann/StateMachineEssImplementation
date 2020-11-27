//
//  ShimmerTextTitle.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct ShimmerTextTitle: View {
    
    let state: ShimmerType
    let text: String
    
    var body: some View {
        switch state {
        
        case .start:
            ShimmerView(size: CGSize(width: 100, height: 30))
            
        case .stop:
            Text(text)
                .font(.title)
                .multilineTextAlignment(.leading)
        }
    }
}

struct ShimmerText_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerTextTitle(state: .stop, text: "Hello")
    }
}
