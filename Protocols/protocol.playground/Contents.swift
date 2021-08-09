import UIKit

protocol PhoneProtocol {
    var number: String { get }
    func makeCall()
}

extension PhoneProtocol {
    func makeCall() {
        print("make phone call")
    }
}

protocol SmartPhoneProtocol {
    func downloadApp(app: String)
}

protocol CombinedProtocol: PhoneProtocol, SmartPhoneProtocol {
    
}

struct iPhone: CombinedProtocol {
    var number: String
    func downloadApp(app: String) {
        print("downloading app from AppStore")
    }

    func useIMessage() {
        print("using iMessage")
    }
}

struct AndroidPhone: CombinedProtocol {
    var number: String
    func downloadApp(app: String) {
        print("downloading app from PlayStore")
    }

    func upgradeStorage() {
        print("updating to 256 BG")
    }
}

let iPhone8 = iPhone(number: "123-123-1234")
let galaxy8 = AndroidPhone(number: "456-456-4567")
iPhone8.makeCall()
galaxy8.makeCall()

let phones: [SmartPhoneProtocol] = []

for phone in phones {
    print(phone)
    phone.downloadApp(app: "angry bird")

    if let phone = phone as? iPhone {
        phone.useIMessage()
    } else if let phone = phone as? AndroidPhone {
        phone.upgradeStorage()
    }
}

struct Person {
    let phone: SmartPhoneProtocol
}

struct FakePhone: SmartPhoneProtocol {
    func downloadApp(app: String) {
        print("can't download app ehre")
    }
    
    func makeCall() {
        print("nothing here")
    }
}

let fakePhone = FakePhone()

/// Dependency Injection
let tim = Person(phone: iPhone8)
let tom = Person(phone: galaxy8)
let tam = Person(phone: fakePhone)
tam.phone.downloadApp(app: "Angry birds")

