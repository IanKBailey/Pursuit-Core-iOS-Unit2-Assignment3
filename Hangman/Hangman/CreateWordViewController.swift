//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class CreateWordViewController: UIViewController {

    
    @IBOutlet weak var enterWordTF: UITextField!
    @IBOutlet weak var confirmWord: UIButton!

    var game = Game()
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    enterWordTF.delegate = self
    
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameViewController = segue.destination as? GameViewController else { return }
        gameViewController.word = game.word

    }

}

extension CreateWordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
        game.word = enterWordTF.text ?? ""
        return true
    }
}
