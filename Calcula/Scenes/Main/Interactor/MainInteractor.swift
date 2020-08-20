//
//  MainMainInteractor.swift
//  Calcula
//
//  Created by Vince Santos on 12/08/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

class MainInteractor: MainInteractorInput {
    weak var output: MainInteractorOutput!
    
    func initializeCurrencyConverter() {
        Calcula.shared.initializeCurrencyConverter {
            self.output.initializedCurrencyConverter()
        }
    }
    
    func calculaProcess(text: String) {
        Calcula.shared.process(string: text) { (result) in
            self.output.calculaResults(text: result)
        }
    }
}
