//
//  GameViewController.swift
//  Hangman
//
//  Created by Ian Bailey on 11/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var userInputs: UITextField!
    
    var word: String = ""
    
    var gameClass = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWord()
        userInputs.delegate = self
        
        
        
    }
    
    func updateWord() {
        currentWord.text = String(repeating: "_", count: word.count)
        
    }
    
    
    
    func gameStatus() {
        if gameClass.guessCount == 0 {
            
            guessedLetters.text = "You Lose"
        }
    }
    
}
extension GameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        var hiddenWord = Array(currentWord.text!)
        
        var indices : Set<Int> = []

        userInputs.resignFirstResponder()
        
        if let userInput = userInputs.text{
            if gameClass.alphabet.contains(userInput.uppercased()) {
                gameClass.letterGuesses.append(userInput)
                
                guessedLetters.text = gameClass.letterGuesses.description
                gameClass.guessCount -= 1
                if gameClass.guessCount == 0 {
                    guessedLetters.text = "You Lose"
                }
                
            }
            
            print(word)
            for (index,char) in word.enumerated() {
                if gameClass.alphabet.contains(userInput.uppercased()) {
                         if Character(userInput) == char {
                             indices.insert(index)
                             print(indices)
                         }

                     }
            }
            
            for (index, _) in hiddenWord.enumerated() {
                       if indices.contains(index) {
                           hiddenWord[index] = Character(userInput)
                        print(indices)
                       }
              }
            
        }
        currentWord.text = hiddenWord.description
        return true
        
    }
}
