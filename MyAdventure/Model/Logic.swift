//
//  Logic.swift
//  MyAdventure
//
//  Created by Charlotte Norsworthy on 2/10/24.
//

import Foundation

// For this struct left buttton is synonymous with top button. Did not realize until too late

struct Logic {
    
    var choiceIndexLeft : Int = 0
    var choiceIndexRight : Int = 1
    
    // Array holding Each Choice
    let choices = [
                Choices("Take Elevator to Dracula's Dungeon", "You find Yourself in a Treasure Room with Two Weapons", 0),
                Choices("Take Elevator to Dracula's Throne Room", "Dracula Sits on His Throne", 0),
                Choices("Choose the Silver Sword", "The Sword's Handle was Poisoned", 1),
                Choices("Choose the Wooden Stake", "Draculs Ambushes You in the Dungeon", 0),
                Choices("Fight Dracula", "He is Immortal, Dummy", 1),
                Choices("Run Away", "You Trigger Booby Trap by the Door", 1),
                Choices("Feint, Then Drive Stake through his Heart", "Dracula doesn't Fall for Cheap Tricks", 1),
                Choices("Allow Dracula to Impale You", "With Guard Let Down the Stake Finds it Home ", 2),
            ]
    
    // Adjust index to Choice
    mutating func increaseIndex(_ index: Int) {
        if index ==  0 {
            choiceIndexLeft = 2
            choiceIndexRight = 3
        }
        else if index ==  1 {
            choiceIndexLeft =  4
            choiceIndexRight = 5
        }
        
        else if index ==  3 {
            choiceIndexLeft = 6
            choiceIndexRight = 7
        }
        
    }
    
    // Restart Adventure
    mutating func ResetIndex() {
        choiceIndexLeft = 0
        choiceIndexRight = 1
    }
    
    func getChoiceLeft() -> String {
        return choices[choiceIndexLeft].choice
    }
    
    func getChoiceRight() -> String {
        return choices[choiceIndexRight].choice
    }
    
    func getOutcomeLeft() -> String {
        return choices[choiceIndexLeft].outcome
    }
    
    func getOutcomeRight() -> String {
        return choices[choiceIndexRight].outcome
    }
    
    func getStatusLeft() -> Int {
        return choices[choiceIndexLeft].status
    }
    
    func getStatusRight() -> Int {
        return choices[choiceIndexRight].status
    }
    
}
