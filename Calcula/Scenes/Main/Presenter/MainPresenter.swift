//
//  MainMainPresenter.swift
//  Calcula
//
//  Created by Vince Santos on 12/08/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

class MainPresenter: MainModuleInput, MainViewOutput, MainInteractorOutput {
    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!

    func viewIsReady() {

    }
    
    func textToProcess(text: String) {
        interactor.calculaProcess(text: text)
    }
    
    func calculaResults(text: String) {
        view.setCalculaOutput(text: text)
    }
}
