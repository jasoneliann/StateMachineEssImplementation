//
//  EmailViewModel.swift
//  StateMachine
//
//  Created by Jason Elian on 21/11/20.
//

import Foundation

internal
class EmailViewModel: ObservableObject {
    // MARK: Published Properties
    @Published
    internal private(set)
    var emails: [Content] = [] {
        didSet {
            updateSelectedEmailCount()
        }
    }
    
    @Published
    internal private(set)
    var selectedEmail: Int = 0
    
    internal
    struct Content: Identifiable {
        let id = UUID()
        var email: EmailCell.Content
    }
    
    // MARK: - Default Functions
    internal
    init(contents: [Content]) {
        self.allEmails = contents
        self.emails = contents
    }
    
    
    // MARK: - Private Properties
    private
    var allEmails: [Content] {
        didSet {
            self.emails = allEmails
        }
    }
    
    // MARK: - Functions
    internal
    func changeState(
        idContent id: UUID,
        withState state: EditingState
    ) {
        for index in 0 ..< self.allEmails.count where allEmails[index].id == id
        {
            self.allEmails[index].email.state = state
        }
    }
    
    internal
    func toggleState(
        idContent id: UUID,
        withState state: EditingState,
        isFlaggedMode mode: Bool = false
    ) {
        for index in 0 ..< self.allEmails.count where allEmails[index].id == id
        {
            let state: EditingState
            switch self.allEmails[index].email.state {
            case .normal:
                state = .normal
            
            // TODO: - 7. Add The Flag State Condition
            case .flag:
                state = .unselected
                        
            case .selected:
                state = .unselected
            
            // FIXME: - 8. Add The new Logic Flag When Unselected
            case .unselected:
                state = (mode) ? .flag : .selected
            }
            
            self.allEmails[index].email.state = state
        }
    }
    
    private
    func updateSelectedEmailCount() {
        self.selectedEmail = self.allEmails.reduce(0) { (result, email) in
            if email.email.state == .selected {
                return result + 1
            }
            return result
        }
    }
    
    internal
    func filterBy(text: String) {
        let lowercasedText: String = text.lowercased()
        self.emails = self.allEmails.filter {
            $0.email.titleDesc.desc.lowercased().contains(lowercasedText)
                || $0.email.titleDesc.title.lowercased().contains(text)
        }
    }
    
    internal
    func reset() {
        for index in 0 ..< self.allEmails.count {
            self.allEmails[index].email.state = .normal
        }
    }
    
    internal
    func find(uuid: UUID) -> Content? {
        for email in allEmails where email.id == uuid {
            return email
        }
        
        return nil
    }
}
