//
//  ShimmerImage.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct ShimmerImage: View {
    
    let state: ShimmerType
    let image: UIImage
    
    var body: some View {
        switch state {
        
        case .start:
            ShimmerView(size: CGSize(width: 100, height: 200))
            
        case .stop:
            Image(uiImage: image)
        }
    }
}

struct ShimmerImage_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerImage(state: .start, image: UIImage())
    }
}
