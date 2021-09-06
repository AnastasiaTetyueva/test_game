//
//  CompGuessesVC.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 03.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit
import SnapKit

class CompGuessesVC: UIViewController {

    var viewModel: CompGuessesVM
    
    init(_ vm: CompGuessesVM) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
        viewModel.vc = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var roundLabel: UILabel = {
        var l = UILabel()
        l.text = "Round № "
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    lazy var compGuessesLabel: UILabel = {
        var l = UILabel()
        l.text = "Think a number between 0 and 100.\nComputer guesses."
        l.numberOfLines = 2
        l.textAlignment = .center
        l.font = UIFont.boldSystemFont(ofSize: 12)
        return l
    }()
    
    lazy var numberIsLabel: UILabel = {
        var l = UILabel()
        l.text = "Number is: 27"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    lazy var moreButton: UIButton = {
        var l = UIButton()
        l.setTitle(">", for: .normal)
        l.backgroundColor = UIColor.orange
        l.showsTouchWhenHighlighted = true
        l.layer.cornerRadius = 5
        l.addTarget(self, action: #selector(pushMoreButton), for: .touchUpInside)
       return l
    }()
    
    lazy var equalButton: UIButton = {
        var l = UIButton()
        l.setTitle("=", for: .normal)
        l.backgroundColor = UIColor.orange
        l.showsTouchWhenHighlighted = true
        l.layer.cornerRadius = 5
        l.addTarget(self, action: #selector(pushEqualButton), for: .touchUpInside)
       return l
    }()
    
    lazy var lessButton: UIButton = {
        var l = UIButton()
        l.setTitle("<", for: .normal)
        l.backgroundColor = UIColor.orange
        l.showsTouchWhenHighlighted = true
        l.layer.cornerRadius = 5
        l.addTarget(self, action: #selector(pushLessButton), for: .touchUpInside)
       return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.view.addSubview(roundLabel)
        self.view.addSubview(compGuessesLabel)
        self.view.addSubview(numberIsLabel)
        self.view.addSubview(moreButton)
        self.view.addSubview(equalButton)
        self.view.addSubview(lessButton)
        
        roundLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalToSuperview().offset(70)
            constraint.width.lessThanOrEqualToSuperview().offset(-40)
            constraint.height.equalTo(30)
        }
        compGuessesLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(roundLabel).offset(50)
            constraint.width.lessThanOrEqualToSuperview().offset(-40)
        }
        numberIsLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(compGuessesLabel).offset(50)
            constraint.width.lessThanOrEqualToSuperview().offset(-40)
        }
        moreButton.snp.makeConstraints { (constraint) in
            constraint.bottom.equalToSuperview().offset(-50)
            constraint.right.equalTo(equalButton).offset(-80)
            constraint.width.equalTo(60)
            constraint.height.equalTo(30)
        }
        equalButton.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.bottom.equalToSuperview().offset(-50)
            constraint.width.equalTo(60)
            constraint.height.equalTo(30)
        }
        lessButton.snp.makeConstraints { (constraint) in
            constraint.bottom.equalToSuperview().offset(-50)
            constraint.left.equalTo(equalButton).offset(80)
            constraint.width.equalTo(60)
            constraint.height.equalTo(30)
        }
        viewModel.guess()
    }
    
    @objc func pushMoreButton() {
        viewModel.biggerTouched()
    }
    
    @objc func pushEqualButton() {
        viewModel.equalTouched()
    }
    
    @objc func pushLessButton() {
        viewModel.lessTouched()
    }

    
}
