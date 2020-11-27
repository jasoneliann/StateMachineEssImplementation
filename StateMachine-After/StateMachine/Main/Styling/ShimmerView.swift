//
//  ShimmerView.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct ShimmerView: View {
    
    @State private var isShowing: Bool = false
    let size: CGSize
    private var aCenter: CGFloat {
        return (self.size.width / 2) + 110
    }
    private let aCornerRadius: CGFloat = 10
    
    
    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.5)
                .frame(height: size.height)
                .cornerRadius(aCornerRadius)
            
            Color.white
                .frame(height: size.height)
                .cornerRadius(aCornerRadius)
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.clear, Color.white.opacity(0.48), Color.clear]
                                ), startPoint: .top, endPoint: .bottom
                            )
                        )
                        .rotationEffect(.init(degrees: -70))
                        .offset( x: self.isShowing ? aCenter : -aCenter )
                )
                .clipped()
        }
        .onAppear {
            
            withAnimation(
                Animation
                    .default
                    .speed(0.15)
                    .delay(0)
                    .repeatForever(autoreverses: false)
            ) {
                self.isShowing.toggle()
            }
        }
    }
}

struct ShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerView(size: CGSize(width: 50, height: 50))
    }
}
