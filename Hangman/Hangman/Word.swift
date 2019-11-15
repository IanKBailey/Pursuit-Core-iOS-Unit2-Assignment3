//
//  Word.swift
//  Hangman
//
//  Created by Ian Bailey on 11/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


class Game {
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var word: String = ""
    var guessCount: Int = 7
    var enterWord: Bool = false
    var letterGuesses = [String]()
    
}

enum Status {
    case win
    case lose
    
}



