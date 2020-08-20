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
    
    private var activityIndicator = ActivityIndicator()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        output.setupServices()
        setupDelegate()
    }
    
    // MARK: MainViewSetup
    func setupDelegate() {
        inputTextView.delegate = self
    }

    // MARK: MainViewInput
    func processText(text: String) {
        output.textToProcess(text: text)
    }
    
    func showActivityIndicator() {
        activityIndicator.show(uiView: self)
    }
    
    func hideActivityIndicator() {
        activityIndicator.stop(uiView: self)
    }
    
    // MARK: MainViewOutput
    func setCalculaOutput(text: String) {
        outputTextView.text = text
    }
}

extension MainViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        processText(text: textView.text ?? "")
    }
}
