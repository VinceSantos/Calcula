//
//  MainMainViewController.swift
//  Calcula
//
//  Created by Vince Santos on 12/08/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewInput {

    var output: MainViewOutput!

    @IBOutlet weak var outputTextView: UILabel!
    @IBOutlet weak var inputTextView: UITextField!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: MainViewInput
    func setupInitialState() {
    }
    
    // MARK: Actions
    @IBAction func textfieldDidChange(_ sender: Any) {
        let textfield = sender as! UITextField
        processText(text: textfield.text ?? "")
    }
    
    func processText(text: String) {
        if !text.isEmpty {
            let tokens = text.split(separator: " ")
            if tokens.contains("plus") {
                var total = 0
                for item in tokens {
                    if let number = Int(item) {
                        total += number
                    }
                }
                outputTextView.text = total.description
            }
        } else {
            outputTextView.text = ""
        }
    }
}
