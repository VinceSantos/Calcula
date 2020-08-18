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

    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var inputTextView: UITextView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        inputTextView.delegate = self
    }

    // MARK: MainViewInput
    func setupInitialState() {
    }
    
    // MARK: Input
    func processText(text: String) {
        output.textToProcess(text: text)
    }
    
    
    // MARK: Output
    func setCalculaOutput(text: String) {
        outputTextView.text = text
    }
}

extension MainViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        processText(text: textView.text ?? "")
    }
}
