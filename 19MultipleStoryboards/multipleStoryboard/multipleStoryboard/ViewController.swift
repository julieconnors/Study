//
//  ViewController.swift
//  multipleStoryboard
//
//  Created by Luat on 8/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func navToHomeVCPressed(_ sender: Any) {
        navToHome()
    }
    
    var storedValue = "10"
    var computedValue: Int {
        get {
            Int(storedValue) ?? 0
        }
        set {
            storedValue = "\(newValue)"
        }
    }
    
    var storedValueTwo = 15 {
        didSet {
            print("storedValueTwo has changed \(storedValueTwo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("storedValue", storedValue)
        print("computedValue", computedValue)
        computedValue = 20
        print("storedValue", storedValue)
        print("computedValue", computedValue)
        storedValueTwo = 100
    }

    func navToHome() {
        let homeSB = UIStoryboard(name: "Home", bundle: nil)
        if let homeVC = homeSB.instantiateViewController(identifier: "HomeVC") as? HomeViewController {
            navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}

