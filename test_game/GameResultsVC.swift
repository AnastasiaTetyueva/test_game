//
//  YouWinVC.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 03.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class GameResultsVC: UIViewController {
    var resultText: String?
    var router: GameRouter?
    
    lazy var resultLabel: UILabel = {
        var l = UILabel()
        l.text = "Result"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    lazy var youWinLabel: UILabel = {
        var l = UILabel()
        l.text = resultText
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    lazy var dismissButton: UIButton = {
        var l = UIButton()
        l.setTitle("Dismiss", for: .normal)
        l.backgroundColor = UIColor.orange
        l.showsTouchWhenHighlighted = true
        l.layer.cornerRadius = 5
        l.addTarget(self, action: #selector(pushDismissButton), for: .touchUpInside)
       return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.view.addSubview(resultLabel)
        self.view.addSubview(youWinLabel)
        self.view.addSubview(dismissButton)
        
        resultLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalToSuperview().offset(70)
            constraint.width.equalTo(80)
            constraint.height.equalTo(30)
        }
        youWinLabel.snp.makeConstraints { (constraint) in
            constraint.center.equalToSuperview()
            constraint.width.equalTo(100)
            constraint.height.equalTo(30)
        }
        dismissButton.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.bottom.equalToSuperview().offset(-50)
            constraint.width.equalTo(160)
            constraint.height.equalTo(30)
        }
    }
    
   @objc func pushDismissButton() {
        router?.showStartScreen()
    }

    
}
