//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var labelDone: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 8, "Hard": 12]
    
    var player: AVAudioPlayer?
    
    var totalTime = 0
    var secondPassed = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        progressBar.progress = 0.0
        
    }
  
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        secondPassed = 0
        totalTime = 0
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        
        totalTime = result
        labelDone.text = ""
        
        progressBar.progress = 0.0
        
        
        
      
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,selector: #selector(updateTimer),userInfo: nil, repeats: true)
            }

            
            @objc func updateTimer() {
                if secondPassed < totalTime {
                    secondPassed += 1
                    progressBar.progress = Float(secondPassed) / Float(totalTime)
                } else {
                    timer.invalidate()
                    labelDone.text = "Egg is ready."
                    playSound(soundName: "alarm_sound")
                    
                }
            }
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()

        
    }
    
}

