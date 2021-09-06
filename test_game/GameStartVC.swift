//
//  ViewController.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 03.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit
import SnapKit

class GameStartVC: UIViewController {
    var gameModel: GameModel?
    lazy var router: GameRouter = {
        let result = GameRouter()
        result.presenter = self
        return result
    }()
    
    lazy var startButton: UIButton = {
        var l = UIButton()
        l.setTitle("Start New Game", for: .normal)
        l.backgroundColor = UIColor.orange
        l.showsTouchWhenHighlighted = true
        l.layer.cornerRadius = 5
        l.addTarget(self, action: #selector(pushStartButton), for: .touchUpInside)
       return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Guessing Game"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(startButton)
        
        startButton.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.bottom.equalToSuperview().offset(-50)
            constraint.width.equalTo(160)
            constraint.height.equalTo(30)
        }
    }
    
    
    @objc func pushStartButton() {
        gameModel = GameModel()
        gameModel?.router = router
        gameModel?.startGame()
    }


}

