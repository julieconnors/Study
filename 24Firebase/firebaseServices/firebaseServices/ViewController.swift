//
//  ViewController.swift
//  firebaseServices
//
//  Created by Luat on 9/2/21.
//

import UIKit
import FirebaseDatabase
import FirebaseRemoteConfig

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createUser(email: "testingCreateUser", username: "someName@gmail-com")
        crashlytics()
        getRemoteConfig()
    }

    /// 1. Firebase Database
    func createUser(email: String, username: String) {
        
        let ref = Database.database().reference()
        let refString = "users/" + username
        
        ref.child(refString).setValue([
            "email": email,
        ])
    }
    
    /// 2. Crash report
    func crashlytics() {
        
        let crashButton = UIButton(type: .roundedRect)
        crashButton.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        crashButton.setTitle("Test Crash", for: [])
        crashButton.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        
        
        view.addSubview(crashButton)
        
        
    }
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        let _ = numbers[1]
    }
    
    /// 3. Remote Config
    var remoteConfig: RemoteConfig!
    
    func getRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate { changed, error in
                    
                    if changed == true {
                        print("new remote configs values")
                    } else {
                        print("no new changes to remote config")
                    }
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
        
        let featureOne = remoteConfig.configValue(forKey: "featureOne")
        if let color = featureOne.stringValue {
            
            print("current config color: \(color)")
            switch color {
            case "blue":
                DispatchQueue.main.async {
                    self.view.backgroundColor = .cyan
                }
            case "red":
                DispatchQueue.main.async {
                    self.view.backgroundColor = .red
                }
            default:
                DispatchQueue.main.async {
                    self.view.backgroundColor = .white
                }
            }
        }
    }

}

