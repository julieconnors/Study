//
//  ViewController.swift
//  mvvmUser
//
//  Created by Luat on 6/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var accountValueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var userViewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVM()
    }
    
    func updateLabel() {
        fullNameLabel.text = userViewModel.fullName
        emailLabel.text = userViewModel.email
        accountValueLabel.text = userViewModel.accountValue
        locationLabel.text = userViewModel.location
    }
    
    func setupVM() {
        userViewModel = UserViewModel()
        
        let updateCompletion = { [weak self] in
            guard let wself = self else { return }
            wself.updateLabel()
        }
        
        userViewModel.bind(completion: updateCompletion)
        
    }

    deinit {
        print("de init called")
    }
    
}

