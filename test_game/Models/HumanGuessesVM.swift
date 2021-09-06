//
//  HumanGuessesVM.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 06.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class HumanGuessesVM: NSObject {
    weak var vc: HumanGuessesVC?
    var gameModel: GameModel?
    var humanPlayer: HumanPlayerModel?
    var computerPlayer: CompPlayerModel?
    
    init(_ gameModel: GameModel) {
        self.gameModel = gameModel
        self.humanPlayer = gameModel.humanPlayer
        self.computerPlayer = gameModel.computerPlayer
        self.humanPlayer?.incrementStep()
    }
    
    func checkText(_ text: String) {
        guard let computerPlayer = self.computerPlayer,
            let humanPlayer = self.humanPlayer,
            let number = Int(text) else { return }
        let hint = computerPlayer.checkAnswer(number)
        humanPlayer.incrementStep()
        vc?.roundLabel.text = "Round № \(humanPlayer.numberOfSteps)"
        
        if hint == -1 {
            vc?.numberIsLabel.text = "number is <"
        } else if hint == 1 {
            vc?.numberIsLabel.text = "number is >"
        } else {
            gameModel?.nextRound()
        }
        
        vc?.fieldForNumber.text = nil
    }
}
