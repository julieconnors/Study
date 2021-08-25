//
//  ViewController.swift
//  UserDefaultsPractice
//
//  Created by Julie Connors on 8/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    let key = "last input"

    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        findLastInput()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let input = textField.text else { fatalError() }
        
//        UserDefaults.standard.setValue(input, forKey: key)
        saveInput(input: input)

        return true
    }
}

extension ViewController {
    func findLastInput() {
//        if let lastInput = UserDefaults.standard.value(forKey: key) {
//            myTextField.text = lastInput as? String
//        }
        
        guard let lastInput: String = try? DiskStorage.readInput(fromKey: key) else { fatalError() }
        
        myTextField.text = lastInput
    }
    
    func saveInput(input: String) {
        do {
            try DiskStorage.saveInput(withKey: key, value: input)
        } catch {
            print("Cannot save input")
        }
    }
}

/*
 [X]Put a UITextField on the UI

 [X]Make sure it’s centered horizontally AND vertically on the View/ViewController

 [X]Enter your name on the UITextfield (follow the example in my app to get that working)

 [X]Save it to UserDefaults (don’t use a wrapper aka AppDefaults in my example; use UserDefaults directly)

 [X]On App launches, your name should get auto-filled on the textfield
 */
