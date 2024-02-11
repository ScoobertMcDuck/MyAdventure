//
//  ViewController.swift
//  MyAdventure
//
//  Created by Charlotte Norsworthy on 2/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var adventureLogic = Logic()
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var Outcome: UILabel!
    @IBOutlet weak var LeftChoice: UIButton!
    @IBOutlet weak var RightChoice: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    // Update Screen
    @objc func updateUI() {
        LeftChoice.setTitle(adventureLogic.getChoiceLeft(), for: .normal)
        RightChoice.setTitle(adventureLogic.getChoiceRight(), for: .normal)
    }
    
    // Victory
    @objc func ResetUI() {
        // Reset index and UI
        adventureLogic.ResetIndex()
        RightChoice.isEnabled = true
        LeftChoice.isEnabled = true
        Outcome.text = "You Arrive at Dracula's Castle"
        MainLabel.text = "Objective: Kill Dracula"
        updateUI()
    }
    
    // Timer for Reset
    @objc func timerForReset() {
        if counter == 2 {
            ResetUI()
            counter = 0
            timer.invalidate()
        }
        else {
            counter += 1
        }
    }
    
    // Go Down Left Path
    @IBAction func LeftChoiceSelected(_ sender: UIButton) {
        
        // If status says Continue
        if adventureLogic.getStatusLeft() == 0 {
            Outcome.text = adventureLogic.getOutcomeLeft()
            adventureLogic.increaseIndex(adventureLogic.choiceIndexLeft)
            updateUI()
        }
        
        // If status says Death
        else if adventureLogic.getStatusLeft() == 1 {
            Outcome.text = adventureLogic.getOutcomeLeft()
            RightChoice.isEnabled = false
            LeftChoice.isEnabled = false
            MainLabel.text = "You Died!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerForReset), userInfo: nil, repeats: true)
        }
        // If status says Victory
        else if adventureLogic.getStatusLeft() == 2 {
            Outcome.text = adventureLogic.getOutcomeLeft()
            RightChoice.isEnabled = false
            LeftChoice.isEnabled = false
            MainLabel.text = "Dracula is Slain!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerForReset), userInfo: nil, repeats: true)
        }
    }
    
    // Go Down Right Path
    @IBAction func RightChoiceSelected(_ sender: UIButton) {
       
        // If status says Continue
        if adventureLogic.getStatusRight() == 0 {
            Outcome.text = adventureLogic.getOutcomeRight()
            adventureLogic.increaseIndex(adventureLogic.choiceIndexRight)
            updateUI()
        }
        // If status says Death
        else if adventureLogic.getStatusRight() == 1 {
            Outcome.text = adventureLogic.getOutcomeRight()
            RightChoice.isEnabled = false
            LeftChoice.isEnabled = false
            MainLabel.text = "You Died!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerForReset), userInfo: nil, repeats: true)
        }
        // If status says Victory
        else if adventureLogic.getStatusRight() == 2 {
            Outcome.text = adventureLogic.getOutcomeRight()
            RightChoice.isEnabled = false
            LeftChoice.isEnabled = false
            MainLabel.text = "Dracula is Slain!"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerForReset), userInfo: nil, repeats: true)
        }
    }
}

