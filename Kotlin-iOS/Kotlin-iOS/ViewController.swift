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
        
        baseURLTextField.text = "https://img.te2.io"
        relativeURLTextField.text = "/imageURL.png"
        cropWidthTextField.text = "640"
        cropHeightTextField.text = "480"
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let baseURL = baseURLTextField.text, !baseURL.isEmpty,
            let relativeURL = relativeURLTextField.text, !relativeURL.isEmpty,
            let cropWidthString = cropWidthTextField.text, !cropWidthString.isEmpty,
            let cropWidth = Int32(cropWidthString),
            let cropHeightString = cropHeightTextField.text, !cropHeightString.isEmpty,
            let cropHeight = Int32(cropHeightString) else {
                thumborURLLabel.text = "Please fill out all the fields"
                return
        }
        
        let thumborURL = CommonKt.getFullThumborURL(baseUrl: baseURL, imgRelativePath: relativeURL, width: cropWidth, height: cropHeight)
        thumborURLLabel.text = "Thumbor URL: \(thumborURL)"
    }
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

