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
    
    /**
     var currentOperator: Operator = .neutral
     var resultingValue = 0.0
     
     public func process(string: String, completionHandler: @escaping (String) -> Void) {
         resultingValue = 0
         currentOperator = .neutral
         let sentence = string.split(separator: " ")
         for item in sentence {
             if let number = Double(item) {
                 if currentOperator == .neutral && resultingValue == 0 {
                     resultingValue = number
                 } else if currentOperator == .add {
                     resultingValue += number
                 } else if currentOperator == .minus {
                     resultingValue -= number
                 } else if currentOperator == .multiply {
                     resultingValue *= number
                 } else if currentOperator == .divide {
                     resultingValue /= number
                 }
             } else {
                 if ReservedWords.plus.contains(String(item).lowercased()) {
                     currentOperator = .add
                 } else if ReservedWords.minus.contains(String(item).lowercased()) {
                     currentOperator = .minus
                 } else if ReservedWords.multiply.contains(String(item).lowercased()) {
                     currentOperator = .multiply
                 } else if ReservedWords.divide.contains(String(item).lowercased()) {
                     currentOperator = .divide
                 } else {
                     currentOperator = .neutral
                 }
             }
         }
         completionHandler(String(resultingValue))
     }
    **/
    
    
}

//enum Operator {
//    case add
//    case minus
//    case multiply
//    case divide
//    case neutral
//}
