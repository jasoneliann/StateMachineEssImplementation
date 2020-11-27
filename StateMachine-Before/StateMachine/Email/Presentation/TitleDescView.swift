//
//  TitleDescView.swift
//  StateMachine
//
//  Created by Jason Elian on 24/11/20.
//

import SwiftUI

struct TitleDescView: View {
    
    struct Content {
        let title: String
        let desc: String
    }
    
    let content: Content
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(content.title)
                .lineLimit(1)
                .font(.headline)
            Text(content.desc)
                .lineLimit(3)
                .font(.subheadline)
        }
    }
}

struct TitleDescView_Previews: PreviewProvider {
    static var previews: some View {
        TitleDescView(
            content: TitleDescView.Content(
                title: "Title",
                desc: "Desc"
            )
        )
    }
}
