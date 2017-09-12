//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Kevin Wijendra on 8/31/17.
//  Copyright © 2017 Kevin Wijendra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 5
    let numberOfSounds = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Play Sounds Function
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    // Random Number Function
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            // stop playing
            awesomePlayer.stop()
        }
    }
    
    @IBAction func messagebuttonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Fantastic!",
                        "You Are Great",
                        "You are the Best Programmer Ever",
                        "You're Amazing",
                        "This Program is Awesome",
                        "Swift/iOS Programming is Cool"]
        
        // Showing Messages Using Function
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // Showing Images Using Function
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        
        // Playing Sound Using Function
        if soundSwitch.isOn {
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        
    }
    
}

