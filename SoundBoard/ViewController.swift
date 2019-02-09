//
//  ViewController.swift
//  SoundBoard
//
//  Created by Nick Pechie on 1/26/19.
//  Copyright © 2019 Nick Pechie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var buttons = [UIButton]()
    var scrollView = UIScrollView()
    var player: AVAudioPlayer?
    var soundNames = ["Stephen A Yell",
                      "Stugotz Was Right",
                      "Fraud",
                      "Hakeem Nicks Laugh",
                      "Happy Birthday",
                      "He's That Guy",
                      "I Eat Butt",
                      "It's Friday",
                      "Llama There Goes That Man",
                      "Mark Jackson Llama",
                      "Open Up The Club",
                      "Stat Of The Day",
                      "Yo Chicken Time",
                      "You Don't Get The Show"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setBackground()
        setupButtons()
    }
    
    func setupScrollView() {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
        view.addSubview(scrollView)
    }
    
    func setBackground() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Blue background")
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(imageViewBackground)
        view.sendSubviewToBack(imageViewBackground)
    }
    
    func setupButtons() {
        let width = UIScreen.main.bounds.size.width
        let soundQuantity = soundNames.count
        for count in 0...soundQuantity - 1 {
            let button = UIButton()
            button.tag = count
            button.backgroundColor = .gray
            button.frame = CGRect(x: 50, y: count * 50 + 10, width: Int(width-100), height: 30)
            button.setTitle(soundNames[count], for: .normal)
            button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
            scrollView.addSubview(button)
        }
    }
    
    @objc func playSound(sender:UIButton!) {
        print(sender.tag)
        print(soundNames[sender.tag])
        if let fileURL = Bundle.main.url(forResource: soundNames[sender.tag], withExtension: "mp3") {
            do {
                try player = AVAudioPlayer(contentsOf: fileURL)
            } catch let error {
                print(error.localizedDescription)
            }
            player?.play()
        } else {
            print("Error: No file with specified name exists")
        }
    }
    
}
