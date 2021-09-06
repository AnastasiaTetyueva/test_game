//
//  PlayerModel.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 05.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class PlayerModel: NSObject {    
    var numberOfSteps: Int = 0
    
    func incrementStep() {
        numberOfSteps = numberOfSteps + 1
    }
}
