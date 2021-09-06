//
//  CompPlayerModel.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 05.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class CompPlayerModel: PlayerModel {
    private var low: Int = 0
    private var high: Int = 100
    var currentNumber = 0
    
    private var myNumber = Int.random(in:0...100)
    
    func guess() -> Int {
        currentNumber = Int.random(in:low...high)
        incrementStep()
        return currentNumber
    }
    
    func hint(_ value: Int) {
        if value == 1 {
            low = currentNumber
        } else if value == -1 {
            high = currentNumber
        }
    }
    
    func checkAnswer(_ number: Int) -> Int {
        if number > myNumber {
            return -1
        } else if number < myNumber {
            return 1
        } else {
            return 0
        }
    }
    

}
