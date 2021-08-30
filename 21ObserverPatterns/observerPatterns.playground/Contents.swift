import UIKit
import WebKit

/// 1. Property observers

var dataArray: [String] = []

var obsDataArray: [String] = ["old"] {
    didSet {
        print("data has changed, count: \(obsDataArray.count)")
    }
}

obsDataArray.append("new string")
obsDataArray.append("new string")


/// 2. Key Value Observing (KVO): Observation block

var webView = WKWebView(frame: .zero)
var estimateObservation: NSKeyValueObservation?

estimateObservation = webView.observe(\.estimatedProgress, options: [.old, .new]) { webView, change in
    
    print("observing estimated OLD progress:", change.oldValue ?? "no value")
    print("observing estimated NEW progress:", change.newValue ?? "no value")
    
}

let url = URL(string: "https://google.com")!
webView.load(URLRequest(url: url))

/// No longer required to call invalidate
//estimateObservation?.invalidate()

//var urlOBservation: NSKeyValueObservation?
//urlOBservation = webView.observe(\.url, options: .new) { webView, change in
//
//    print("observing url newValue:", change.newValue! ?? "no value")
//
//}


/// 3. Notification center

var loginName = Notification.Name("login")
var loginSuccess = Notification(name: loginName)

class AccountViewController {
    func observeForLogin() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogin), name: loginName, object: nil)
    }
    
    @objc func handleLogin(_ notification: Notification) {
        print("EVENT: user is logged in, updating UI...")
        let value = notification.userInfo?["name"] ?? ""
        print("with userInfo: \(value)")
    }
    
    func stopObserving() {
        /// iOS 9.0: no longer required to remove observers
        NotificationCenter.default.removeObserver(self, name: loginName, object: nil)
    }
}

var accountVC: AccountViewController? = AccountViewController()
accountVC?.observeForLogin()
//accountVC = nil

let info = ["name": "texas"]
let noti = Notification(name: loginName, object: nil, userInfo: info)
NotificationCenter.default.post(noti)

//NotificationCenter.default.post(loginSuccess)
//accountVC?.stopObserving()
//NotificationCenter.default.post(loginSuccess)
