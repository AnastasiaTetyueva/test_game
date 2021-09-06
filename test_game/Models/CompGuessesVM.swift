//
//  CompGuessesVM.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 06.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class CompGuessesVM: NSObject {
    var gameModel: GameModel?
    var computerPlayer: CompPlayerModel?
    var value: Int?
    
    weak var vc: CompGuessesVC?
    
    init(_ gameModel: GameModel) {
        self.gameModel = gameModel
        self.computerPlayer = gameModel.computerPlayer
    }
    
    func guess() {
        self.value = computerPlayer?.guess()
        updateUI()
    }
    
    func updateUI() {
        guard let computerPlayer = computerPlayer else {
            vc?.roundLabel.text = ""
            vc?.numberIsLabel.text = ""
            return
        }
        vc?.roundLabel.text = "Round № \(computerPlayer.numberOfSteps)"
        vc?.numberIsLabel.text = "Number is \(computerPlayer.currentNumber)"
        
    }
    
    @objc func biggerTouched() {
        computerPlayer?.hint(1)
        guess()
    }
    
    @objc func lessTouched() {
        computerPlayer?.hint(-1)
        guess()
    }
    
    @objc func equalTouched() {
        // end the game round
        gameModel?.nextRound()
    }
    
}
