//
//  StateMachineApp.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import SwiftUI

@main
struct StateMachineApp: App {
    
    var body: some Scene {
        WindowGroup {
            EmailView(
                emailViewModel: EmailViewModel(
                    contents: generateExampleEmailView()
                )
            )
        }
    }
}
