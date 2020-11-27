//
//  DetailView.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct DetailView: View {
    
    let content: EmailViewModel.Content
    
    
    var body: some View {
        ScrollView {
            VStack {
                TitleDescView(
                    content: content.email.titleDesc
                )
                .padding(10)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(content: generateExampleEmailView()[0])
    }
}
