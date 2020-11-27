//
//  HomeScreenView.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

struct HomeScreenView: View {
    
    var contents: [MHomeCell]
    
    
    var body: some View {
        NavigationView {
            List(contents) { (content) in
                
                if content.state == .available {
                    Text("Hello")
                    /*NavigationLink(
                        destination: DetailView(content: content),
                        label: {
                            HomeCell(content: content)
                                .padding([.top, .bottom], 10)
                        })*/
                } else {
                    HomeCell(content: content)
                        .padding([.top, .bottom], 10)
                }
                
            }
            .navigationTitle("HomeScreen")
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        let inputs: [MHomeCell] = [
            MHomeCell(state: .available, currentTitle: "Toko Susu", currentDescription: "Toko Susu Terbaik"),
            MHomeCell(state: .loading, currentTitle: "Toko Susu", currentDescription: "Toko Susu Terbaik"),
            MHomeCell(state: .noContent, currentTitle: "Toko Susu Terbaik", currentDescription: "Toko Susu Terbaik"),
            MHomeCell(state: .noContent, currentTitle: "Toko susu", currentDescription: "Toko Susu terbaik"),
            MHomeCell(state: .loading, currentTitle: "Toko Susu", currentDescription: "Toko Susu Terbaik"),
            MHomeCell(state: .available, currentTitle: "Toko Garam", currentDescription: "Toko garam laut yang sangat menyegarkan")
        ]
        HomeScreenView(contents: inputs)
    }
}
