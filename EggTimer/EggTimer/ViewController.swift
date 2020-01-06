//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // to import alarm audo

class ViewController: UIViewController {
    
    var player: AVAudioPlayer? // for alarm audio
    
    @IBOutlet var labelView: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]  // key and value of Dictonary represent the time taken to boil egg
    
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
// button function
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle! // store the result which button is pressed
        totalTime = eggTimes[hardness]! //get the value from dictonary
        
        progressBar.progress = 0 // to restart proccess
        secondsPassed = 0 // to restart proccess
        labelView.text = hardness // show which one is selected
        
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true) // for timer
        
       
        
    }
    
// section of alarm audio
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
// function for counter update
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= totalTime {
            
           let progessPercent = Float(secondsPassed) / Float(totalTime) // progress bar sliding
            
            progressBar.progress = progessPercent
            
            secondsPassed += 1
            
        }
        else{
            labelView.text = "done" // after complete the process done is shown
            playSound() // call the alarm function when egg is boiled
        }
    }

}
