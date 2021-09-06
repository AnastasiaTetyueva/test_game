//
//  GameModel.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 05.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class GameModel: NSObject {
    var humanPlayer = HumanPlayerModel()
    var computerPlayer = CompPlayerModel()
    var router: GameRouter?
    
    private var step: Int = 1

    func startGame() {
        router?.showCompGuessScreen(self)
    }
    
    func nextRound() {
        step = step + 1
        if step == 2 {
            router?.showHumanGuessScreen(self) 
        } else {
            if humanPlayer.numberOfSteps < computerPlayer.numberOfSteps {
                router?.showResults(text: "You win!")
            } else {
                router?.showResults(text: "You lose :(")
            }
            
        }
    }
    
    
}
