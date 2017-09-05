//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Kevin Wijendra on 8/31/17.
//  Copyright © 2017 Kevin Wijendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    var index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    
    @IBAction func messagebuttonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Fantastic!",
                        "You Are Great",
                        "You are the Best Programmer Ever",
                        "You're Amazing",
                        "This Program is Awesome",
                        "Swift/iOS Programming is Cool"]
        
        // Showing new messages without repeating last message (Uses nonRepeatingRandom funciton we made above)
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
    }
    
}

