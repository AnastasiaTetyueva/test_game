//
//  YouGuessesVC.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 03.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit
import SnapKit

class HumanGuessesVC: UIViewController, UITextFieldDelegate {
    var viewModel: HumanGuessesVM
    
    init(_ vm: HumanGuessesVM) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
        viewModel.vc = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    lazy var roundLabel: UILabel = {
        var l = UILabel()
        l.text = "Round № 1"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    lazy var youGuessesLabel: UILabel = {
        var l = UILabel()
        l.text = "you guesses"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    lazy var fieldForNumber: UITextField = {
        let l = UITextField()
        l.layer.borderWidth = 1.0
        l.contentVerticalAlignment = .center
        l.textAlignment = .center
        l.backgroundColor = UIColor.white
        l.keyboardType = .decimalPad
        l.delegate = self
        return l
    }()
    
    lazy var enterButton: UIButton = {
        var l = UIButton()
        l.setTitle("Enter the number", for: .normal)
        l.backgroundColor = UIColor.orange
        l.showsTouchWhenHighlighted = true
        l.layer.cornerRadius = 5
        l.addTarget(self, action: #selector(pushEnterButton), for: .touchUpInside)
       return l
    }()
    
    lazy var numberIsLabel: UILabel = {
        var l = UILabel()
        l.text = ""
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.view.addSubview(roundLabel)
        self.view.addSubview(youGuessesLabel)
        self.view.addSubview(fieldForNumber)
        self.view.addSubview(enterButton)
        self.view.addSubview(numberIsLabel)
        
        roundLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalToSuperview().offset(70)
            constraint.width.equalTo(100)
            constraint.height.equalTo(30)
        }
        youGuessesLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(roundLabel).offset(50)
            constraint.width.equalTo(100)
            constraint.height.equalTo(30)
        }
        fieldForNumber.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(youGuessesLabel).offset(50)
            constraint.width.equalTo(160)
            constraint.height.equalTo(30)
        }
        enterButton.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.top.equalTo(fieldForNumber).offset(50)
            constraint.width.equalTo(160)
            constraint.height.equalTo(30)
        }
        numberIsLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalToSuperview()
            constraint.bottom.equalToSuperview().offset(-50)
            constraint.width.equalTo(100)
            constraint.height.equalTo(30)
        }
        
    }

    @objc func pushEnterButton() {
        guard let text = fieldForNumber.text else { return }
        viewModel.checkText(text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    // проверка на введение только цифр
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

}
