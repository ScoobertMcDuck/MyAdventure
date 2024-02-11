//
//  Choices.swift
//  MyAdventure
//
//  Created by Charlotte Norsworthy on 2/10/24.
//

import Foundation

struct Choices {
    
    init(_ choi: String, _ out:String, _ stat: Int) {
        choice = choi
        outcome = out
        status = stat
    }
    
    var choice: String // Button text
    var outcome: String // Label text
    var status: Int // 0 continue, 1 lose, 2 win
    
}
