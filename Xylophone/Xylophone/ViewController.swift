//
//  ViewController.swift
//  Xylophone
//
//  Created by Балжан Бозбашаeва on 17.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audio: AVAudioPlayer!
    var soundArray = ["A", "B", "C", "D", "E", "F", "G"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        //Определяем звук связанный с кнопкой но почему что не работает надо исправить ><
        let selectedSound = soundArray[(sender.tag) - 1]
        playSound(choosedSound: selectedSound)
        
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            sender.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(choosedSound: String) {
        //загрузка звукового файла
        if let soundUrl = Bundle.main.url(forResource: choosedSound, withExtension: ".wav") {
            do {
                audio = try AVAudioPlayer(contentsOf: soundUrl)
                audio.prepareToPlay()
                audio.play()
            } catch {
                print(error)
            }
        } else {
            print(choosedSound)
        }
    }
}
