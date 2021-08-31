//
//  UserViewModel.swift
//  mvvmUser
//
//  Created by Luat on 6/14/21.
//

import Foundation

class UserViewModel {
    var userModel: UserModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUIClosure?()
            }
        }
    }
    
    init() {
        fetchUser()
    }
    
    func bind(completion: @escaping () -> Void) {
        self.updateUIClosure = completion
    }
    
    /// update Labels
    var updateUIClosure: (() -> Void)?
    
    func fetchUser() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let fetchedModel = UserModel(fname: "Ceiling",
                                         lname: "Fan",
                                         email: "email@gmail.com",
                                         location: "No Location",
                                         accountValue: 0.0)
            self.userModel = fetchedModel
        }
    }
    
    var fullName: String {
        get {
            return "\(userModel?.fname ?? "") \(userModel?.lname ?? "")"
        }
    }
    
    var email: String {
        userModel?.email ?? ""
    }
    
    var accountValue: String {
        "\(userModel?.accountValue ?? 0)"
    }
    
    var location: String {
        userModel?.location ?? ""
    }

}
