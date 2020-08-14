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
        Calcula.shared.process(string: text) { (result) in
            self.outputTextView.text = result
        }
    }
}
