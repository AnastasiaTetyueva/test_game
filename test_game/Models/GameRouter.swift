//
//  GameRouter.swift
//  test_game
//
//  Created by Anastasia Tetyueva on 06.09.2021.
//  Copyright © 2021 Anastasia Tetyueva. All rights reserved.
//

import UIKit

class GameRouter: NSObject {
    
    var presenter: UIViewController?
    
    func showStartScreen() {
        if let current = presenter?.presentedViewController {
            current.dismiss(animated: true, completion: nil)
        }
    }
    
    func showCompGuessScreen(_ model: GameModel) {
        let vm = CompGuessesVM(model)
        let vc = CompGuessesVC(vm)
        presenter?.present(vc, animated: true, completion: nil)
    }
    
    func showHumanGuessScreen(_ model: GameModel) {
        presenter?.presentedViewController?.modalTransitionStyle = .flipHorizontal
        presenter?.presentedViewController?.dismiss(animated: true, completion: {
            [weak self] in
            let vm = HumanGuessesVM(model)
            let vc = HumanGuessesVC(vm)
            vc.modalTransitionStyle = .flipHorizontal
            self?.presenter?.present(vc, animated: true, completion: nil)
        })
    }
    
    func showResults(text: String) {
        presenter?.presentedViewController?.dismiss(animated: true, completion: {
            [weak self] in
            let vc = GameResultsVC()
            vc.router = self
            vc.resultText = text
            vc.modalTransitionStyle = .flipHorizontal
            self?.presenter?.present(vc, animated: true, completion: {
                vc.modalTransitionStyle = .coverVertical
            })
        })
        
    }
}
