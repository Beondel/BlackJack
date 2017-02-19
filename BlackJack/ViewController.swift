//
//  ViewController.swift
//  BlackJack
//
//  Created by Benjamin Macmillan on 2/18/17.
//  Copyright © 2017 Bloop Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var deck = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4,
                5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7,
                8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10,
                11, 11, 11, 11]
    var cpuScore = 0
    var playerScore = 0
    let maxNum = 21
    var cardCount = 0
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var dealerScoreText: UILabel!
    
    // player cards
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    @IBOutlet weak var card7: UIImageView!
    @IBOutlet weak var card8: UIImageView!
    @IBOutlet weak var card9: UIImageView!
    @IBOutlet weak var card10: UIImageView!
    @IBOutlet weak var card11: UIImageView!
    @IBOutlet weak var card12: UIImageView!
    
    // cpu card
    @IBOutlet weak var cpuCard: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitPressed(_ sender: Any) {
        cardCount = cardCount + 1
        let cpuNum = Int(arc4random_uniform(UInt32(deck.count - 1)))
        let playerNum = Int(arc4random_uniform(UInt32(deck.count - 1)))
        let localcpuCard = deck[cpuNum]
        let localplayerCard = deck[playerNum]
        deck.remove(at: cpuNum)
        deck.remove(at: playerNum)
        
        cpuCard.image = UIImage(named: "card\(localcpuCard)")
        
        if (cardCount == 1) {
            card1.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 2) {
            card2.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 3) {
            card3.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 4) {
            card4.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 5) {
            card5.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 6) {
            card6.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 7) {
            card7.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 8) {
            card8.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 9) {
            card9.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 10) {
            card10.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 11) {
            card11.image = UIImage(named: "card\(localplayerCard)")
        } else if (cardCount == 12) {
            card12.image = UIImage(named: "card\(localplayerCard)")
        }
        
        cpuScore = cpuScore + localcpuCard
        playerScore = playerScore + localplayerCard
        dealerScoreText.text = "\(cpuScore)"
        
        if (cpuScore > maxNum && playerScore > maxNum) {
            if (cpuScore > playerScore) {
                result.text = "You Win!"
            } else if (playerScore > cpuScore) {
                result.text = "You Lose!"
            } else {
                result.text = "Draw!"
            }
        } else if (playerScore > maxNum) {
            result.text = "You Lose!"
        } else if (cpuScore > 21) {
            result.text = "You Win!"
        }
    }
}

