//
//  ViewController.swift
//  mvvmUser
//
//  Created by Luat on 6/14/21.
//

/// M V V M
/// Model
/// View
/// VM: ViewModel
/// C: Controller
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var accountValueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var userViewModel: UserViewModel!
    
//    var dataArray = ["objc 1", "item 2"] {
//        didSet {
//            /// knows when the model changes
//        }
//    }
         
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
        
        let updateCompletion = {
            self.updateLabel()
        }
        
        userViewModel.bind(completion: updateCompletion)
        
    }

    deinit {
        print("de init called")
    }
    
}

