//
//  Calcula.swift
//  Calcula
//
//  Created by Vince Santos on 8/15/20.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

import Foundation
import Money

class Calcula {
    static let shared = Calcula()
    let url = URL(string: Constants.fixerUrl)
    let localDateService = LocalDateService()
    
    public func initializeCurrencyConverter(completionHandler: @escaping () -> Void) {
        var currentDate = Date().localDate()
        localDateService.loadLocalDate { (date) in
            if let dateValue = date {
                
            } else {
                self.localDateService.saveLocalDate(date: currentDate) { (success) in
                    if success {
                        print("saved date to local")
                    } else {
                        print("something went wrong")
                    }
                }
            }
        }
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if let _ = error {
//                print("hasError")
//            } else {
//                do {
//                    if let content = data {
//                        let jsonData = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                        let rates = jsonData["rates"] as! NSDictionary
//                        let rate = rates["USD"] as! NSNumber
//                        let EURtoUSD = CurrencyPair<EUR, USD>(rate: rate.decimalValue)
//
//                        let euros: Money<EUR> = 123.45
//                        let dollars = EURtoUSD.convert(euros).rounded
//                        print(dollars)
//                    }
//                } catch {
//                    print("error with JSON")
//                }
//                completionHandler()
//            }
//        }.resume()
    }
    
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

extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}

        return localDate
    }
}
