//
//  EmailView.swift
//  StateMachine
//
//  Created by Jason Elian on 14/11/20.
//
// 10 Times bigger font than the default

import SwiftUI

struct EmailView: View {
    
    enum EmailState {
        case normal
        case search(withKeyword: String)
        case selecting(content: EmailViewModel.Content?, isFlaggedMode: Bool = false)
    }
    
    enum EventState {
        case textFieldEdited(text: String)
        case toolBarSelected
        case clickedCell(content: EmailViewModel.Content)
        // TODO: 1. Add LongPress Event
        case longPressedCell(content: EmailViewModel.Content)
    }
        
    @ObservedObject
    var emailViewModel: EmailViewModel
    
    @State private
    var state: EmailState = .normal {
        didSet {
            respondToState()
        }
    }
    
    @State private
    var eventState: EventState = .toolBarSelected {
        didSet {
            handleChangesEvent()
        }
    }
    
    @State private
    var counterSelected: Int = 0
    
    @State private
    var typedTextField: String = ""
    
    private
    var navMessages: String {
        return generateNavBarTitle(count: self.emailViewModel.selectedEmail)
    }
    
    private
    var toolBarMessage: String {
        switch self.state {
        case .normal:
            return "Edit"
            
        case .selecting, .search:
            return "Cancel"
        
        }
    }
    
    var body: some View {
        
        NavigationView {
            List(emailViewModel.emails) { (content) in
                
                switch self.state {
                
                case .normal, .search:
                    NavigationLink(
                        destination: DetailView(content: content),
                        label: {
                            EmailCell(content: content.email)
                        }
                    )
                    
                case .selecting:
                    EmailCell(
                        content: content.email
                    )
                    .onTapGesture(
                        perform: {
                            self.eventState = .clickedCell(content: content)
                        }
                    )
                    // TODO: - 2. Long Press Gesture
                    .onLongPressGesture {
                        self.eventState = .longPressedCell(content: content)
                    }
                }
            }
            .navigationTitle(navMessages)
            .navigationBarItems(
                leading:
                    TextField(
                        "Search",
                        text: self.$typedTextField,
                        onCommit: {
                            self.eventState = .textFieldEdited(text: self.typedTextField)
                        }
                    )
                    .padding()
                    .frame(maxWidth: 100, alignment: .leading),
                trailing: Button(
                    toolBarMessage,
                    action: {
                        self.eventState = .toolBarSelected
                    }
                )
            )
        }
    }
}

extension EmailView {
    private
    func handleChangesEvent() {
        
        switch (self.state, self.eventState) {
        
        case (.normal, .toolBarSelected):
            self.state = .selecting(content: nil)
        
        case (.selecting, .toolBarSelected),
             (.search, .toolBarSelected):
            self.state = .normal
            
        case (.selecting, .clickedCell(let content)):
            debugPrint("Clicked Cell with Content == \(content)")
            self.state = .selecting(content: content, isFlaggedMode: false)
            
        // TODO: - 3. Add Selecting Long press cell
        case (.selecting, .longPressedCell(let content)):
            self.state = .selecting(content: content, isFlaggedMode: true)
            
        case (_, .textFieldEdited(let text)):
            self.state = (text.isEmpty) ? .normal : .search(withKeyword: text)
        
        case (_, .clickedCell),
             // TODO: - 4. Add Long Another Long PressCell Event
             (_, .longPressedCell):
            break
        }
    }
    
    private
    func respondCellState(selectedCell: EmailViewModel.Content) {
        for (email) in self.emailViewModel.emails
        where email.id == selectedCell.id
        {
            self.emailViewModel.toggleState(
                idContent: email.id,
                withState: email.email.state
            )
            break
        }
    }
    
    private
    func generateNavBarTitle(count: Int) -> String {
        return (count == 0) ? "Email" : "Selected \(self.emailViewModel.selectedEmail)"
    }
    
    private
    func respondToState() {
        self.counterSelected = 0
                
        switch self.state {
        
        case .normal:
            self.typedTextField = ""
            self.emailViewModel.reset()
            
        case .search(let keyword):
            self.emailViewModel.reset()
            self.emailViewModel.filterBy(text: keyword)
            
        case .selecting(let contentt, let mode):
            guard let unwrappedContent: EmailViewModel.Content = contentt else {
                self.changeState(editingState: .unselected)
                return
            }
            
            self.emailViewModel.toggleState(
                idContent: unwrappedContent.id,
                withState: unwrappedContent.email.state,
                isFlaggedMode: mode
            )
        }
    }
    
    private
    func changeState(editingState: EditingState) {
        for content in self.emailViewModel.emails {
            self.emailViewModel.changeState(
                idContent: content.id,
                withState: editingState
            )
        }
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView(
            emailViewModel: EmailViewModel(
                contents: generateExampleEmailView()
            )
        )
        .environment(\.sizeCategory, .extraExtraLarge)
    }
}
