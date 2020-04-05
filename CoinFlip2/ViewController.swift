//
//  ViewController.swift
//  CoinFlip2
//
//  Created by Hin Wong on 1/27/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var tapScreenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
    @IBAction func tapGestureRecognized(_ sender: Any) {
        let coin = arc4random_uniform(2) + 1
        coinImage.image = UIImage(named: "Side\(coin)")
        
        // coin flip animation
        let coinFlip = CATransition()
        coinFlip.startProgress = 0
        coinFlip.endProgress = 1.0
        coinFlip.type = CATransitionType(rawValue: "flip")
        coinFlip.subtype = CATransitionSubtype(rawValue: "fromBottom")
        coinFlip.duration = 0.5
        coinFlip.repeatCount = 2
        
        coinImage.layer.add(coinFlip, forKey: "transition")
        
        // Update results
        if coin == 1 {
            resultsLabel.text = "You are a hero"
        }
        else if coin == 2 {
            resultsLabel.text = "You are a villain"
        }
    }
}



