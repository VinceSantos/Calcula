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
        
    public func process(string: String, completionHandler: @escaping (String) -> Void) {
        let normalizedString = string.lowercased()
        
        if !normalizedString.isEmpty {
            if normalizedString.last!.isNumber {
                var resultingValue = ""
                let sentence = normalizedString.split(separator: " ")
                for item in sentence {
                    if let number = Double(item) {
                        resultingValue.append(String(number))
                    } else {
                        if ReservedWords.plus.contains(String(item)) {
                            resultingValue.append("+")
                        } else if ReservedWords.minus.contains(String(item)) {
                            resultingValue.append("-")
                        } else if ReservedWords.multiply.contains(String(item)) {
                            resultingValue.append("*")
                        } else if ReservedWords.divide.contains(String(item)) {
                            resultingValue.append("/")
                        }
                    }
                }
                let expression = NSExpression(format: resultingValue)
                let resultNumber = expression.expressionValue(with: nil, context: nil) as! NSNumber
                let normalizedResult = resultNumber.stringValue
                completionHandler(normalizedResult)
            } else {
                completionHandler("")
            }
        } else {
            completionHandler("")
        }
    }
}
