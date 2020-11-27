//
//  HomeCell.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct HomeCell: View {
    
    @State var content: MHomeCell
    private var currentState: ShimmerType { return content.state == .loading ? .start : .stop }
    private var title: String { return content.currentTitle }
    private var desc: String { return content.currentDescription }
    private var isNotAvalable: Bool { return content.state == .noContent }
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            ShimmerImage(state: currentState, image: UIImage())
            ShimmerTextTitle(state: currentState, text: self.isNotAvalable ? "Not Available" : title )
            ShimmerTextDescription(state: currentState, text: self.isNotAvalable ? "Not Available" : desc)
        }
        
    }
}

struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCell(content: MHomeCell(state: .loading, currentTitle: "Title", currentDescription: "Desc"))
    }
}
