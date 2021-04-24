//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // Three ways to get button title
        //print (sender.currentTitle!)
        // print (sender.titleLabel?.text)
        // print (sender.title(for: .normal))
        
        // Chose first methode
        var senderTitle = sender.currentTitle!
        
        // Play sound function call with button title
        playSound(soundName: senderTitle)
        
        // Set button opacity to half
        sender.alpha = 0.5
        
        // Set timer seconds
        let seconds = 0.2
        // Create queue to delay for animation
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Return full opacity of button
            sender.alpha = 1
        }
    }

    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

