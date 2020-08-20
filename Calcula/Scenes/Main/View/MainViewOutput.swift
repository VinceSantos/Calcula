//
//  MainMainViewOutput.swift
//  Calcula
//
//  Created by Vince Santos on 12/08/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

protocol MainViewOutput {

    /**
        @author Vince Santos
        Notify presenter that view is ready
    */

    func viewIsReady()
    func setupServices()
    func textToProcess(text: String)
}
