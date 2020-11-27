//
//  MHomeCell.swift
//  StateMachine
//
//  Created by Jason Elian on 07/11/20.
//

import Foundation
import UIKit.UIImage

enum HomeCellState {
    case loading
    case noContent
    case available
}

struct MHomeCell: Identifiable {
    let id = UUID()
    var state: HomeCellState
    let currentTitle: String
    let currentDescription: String
}
