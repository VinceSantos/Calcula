//
//  MainMainViewInput.swift
//  Calcula
//
//  Created by Vince Santos on 12/08/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

protocol MainViewInput: class {
    func setCalculaOutput(text: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}
