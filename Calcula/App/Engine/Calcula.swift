//
//  Calcula.swift
//  Calcula
//
//  Created by Vince Santos on 8/15/20.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

import Foundation

class Calcula {
    static let shared = Calcula()
    var currentOperator: Operator = .neutral
    var resultingValue = 0
    
    public func process(string: String, completionHandler: @escaping (String) -> Void) {
        resultingValue = 0
        let sentence = string.split(separator: " ")
        for item in sentence {
            if let number = Int(item) {
                if currentOperator == .neutral && resultingValue == 0 {
                    resultingValue = number
                } else if currentOperator == .add {
                    resultingValue += number
                }
            } else {
                if ReservedWords.plus.contains(String(item).lowercased()) {
                    currentOperator = .add
                } else {
                    currentOperator = .neutral
                }
            }
        }
        completionHandler(String(resultingValue))
    }
}

enum Operator {
    case add
    case minus
    case multiply
    case divide
    case neutral
}
