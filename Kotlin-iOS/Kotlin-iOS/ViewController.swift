//
//  ViewController.swift
//  Kotlin-iOS
//
//  Created by Aseem Sandhu on 5/13/19.
//  Copyright © 2019 TE2. All rights reserved.
//

import UIKit
import SharedCode

class ViewController: UIViewController {

    @IBOutlet weak var baseURLTextField: UITextField!
    @IBOutlet weak var relativeURLTextField: UITextField!
    @IBOutlet weak var cropWidthTextField: UITextField!
    @IBOutlet weak var cropHeightTextField: UITextField!
    @IBOutlet weak var thumborURLLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Thumbor Example"
        
        baseURLTextField.delegate = self
        relativeURLTextField.delegate = self
        cropWidthTextField.delegate = self
        cropHeightTextField.delegate = self
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let baseURL = baseURLTextField.text, !baseURL.isEmpty,
            let relativeURL = relativeURLTextField.text, !relativeURL.isEmpty,
            let cropWidth = cropWidthTextField.text, !cropWidth.isEmpty,
            let cropHeight = cropHeightTextField.text, !cropHeight.isEmpty else {
                thumborURLLabel.text = "Please fill out all the fields"
                return
        }
        
        let thumborURL = 
        thumborURLLabel.text = "Thumbor URL: \(baseURL)\(relativeURL)\(cropWidth)\(cropHeight)"
    }
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

