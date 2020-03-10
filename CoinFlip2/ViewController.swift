//
//  ViewController.swift
//  CoinFlip2
//
//  Created by Hin Wong on 1/27/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func flipButton(_ sender: UIButton) {
        
        let coin = arc4random_uniform(2) + 1
        image.image = UIImage(named: "Side\(coin)")
        
        // coin flip animation
        let coinFlip = CATransition()
        coinFlip.startProgress = 0
        coinFlip.endProgress = 1.0
        coinFlip.type = CATransitionType(rawValue: "flip")
        coinFlip.subtype = CATransitionSubtype(rawValue: "fromBottom")
        coinFlip.duration = 0.5
        coinFlip.repeatCount = 2

        image.layer.add(coinFlip, forKey: "transition")
        
        // Update results
        if coin == 1 {
            label.text = "You are a hero"
        }
        else if coin == 2 {
            label.text = "You are a villain"
        }
    }

}

