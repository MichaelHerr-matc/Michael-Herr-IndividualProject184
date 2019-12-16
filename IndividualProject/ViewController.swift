//
//  ViewController.swift
//  IndividualProject
//
//  Created by Michael Her on 11/30/19.
//  Copyright © 2019 Michael Her. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // variables
    var activePlayer = 1 // cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @IBOutlet weak var won: UILabel!
    let winGame = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
    var activeGame = true
    
    
    // function for player
    @IBAction func action(_ sender: Any) {
        if (gameState[(sender as AnyObject).tag-1] == 0 && activeGame == true)
        {
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                (sender as AnyObject).setImage(UIImage(named: "X-letters"), for: UIControl.State())
                activePlayer = 2
            }
            else
            {
                (sender as AnyObject).setImage(UIImage(named: "O-letters"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        // who win the game
        for combination in winGame
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                activeGame = false
                
                if gameState[combination[0]] == 1
                {
                    // X has won
                    won.text = "X has won!"
                }
                else
                {
                    // O has won
                    won.text = "O has won!"
                }
                
                playAgainButton.isHidden = false
                won.isHidden = false
            }
        }
        
        // check to see if tie
        activeGame = false
        for i in gameState
        {
            if i == 0
            {
                activeGame = true
                break
            }
        }
        if activeGame == false
        {
            won.text = "Tie Game!"
            won.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    // play again function
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        won.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

