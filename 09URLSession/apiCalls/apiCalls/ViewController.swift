//
//  ViewController.swift
//  apiCalls
//
//  Created by Luat on 8/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    let jokesStr = "https://api.chucknorris.io/jokes/random"
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    let musicStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    /// Display the joke in firstLabel.text
    /// 1. Make API call to jokes url with URLSession
    /// 2. Parse the JSON data using Codable protocol
    /// 3. Update firstLabel in the main thread with text from response
    @IBAction func jokesPressed(_ sender: UIButton) {
        let decoder = JSONDecoder()

        if let url = URL(string: jokesStr) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let data = data {
                let JokesDecoded = try? decoder.decode(Jokes.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = JokesDecoded?.value
                }
            }
        })
            task.resume()
        }
    }
    
    struct Jokes: Codable {
        let value: String
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        let decoder = JSONDecoder()

        if let url = URL(string: drinksStr) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let data = data {
                let DrinksDecoded = try? decoder.decode(Drinks.self, from: data)
                if let drinkName = DrinksDecoded?.drinks.first?.strDrink {
                    DispatchQueue.main.async {
                        self.firstLabel.text = drinkName
                    }
                }
            }
        })
            task.resume()
        }
    }
    
    struct Drinks: Codable {
        let drinks: [Drink]
    }
    
    struct Drink: Codable {
        let strDrink: String

    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        firstLabel.text = "Testing TVShows button"
<<<<<<< HEAD:URLSession/apiCalls/apiCalls/ViewController.swift
        
        let decoder = JSONDecoder()

        if let url = URL(string: tvShowsStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                if let data = data {
                    if let show = try? decoder.decode([Show].self, from: data) {
                        if let name = show.first?.name {
                            DispatchQueue.main.async {
                                        self.firstLabel.text = name
                            }
                        }
                    }
                }
        })
            task.resume()
        }
=======
        decoding()
>>>>>>> d07149633ac98c7e08808e6699abe195fb2d23d1:09URLSession/apiCalls/apiCalls/ViewController.swift

    }
    
    struct Show: Codable {
        let name: String
    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        firstLabel.text = "Testing music button"
        
        let decoder = JSONDecoder()

        if let url = URL(string: musicStr) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let data = data {
                let FeedDecoded = try? decoder.decode(Info.self, from: data)
                if let ResultsDecoded = FeedDecoded {
                    if let artist = ResultsDecoded.feed.results.first?.artistName {
                        DispatchQueue.main.async {
                            self.firstLabel.text = artist
                        }
                    }
                }
            }
        })
            task.resume()
        }
    }
    
    
    struct Info: Codable {
        let feed: Feed
        
    }
    
    struct Feed: Codable {
        let results: [Song]
    }
    
    struct Song: Codable {
        let artistName: String
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        var string = "aabbcc"
        while string.isEmpty == false {
            string.removeFirst()
        }
    }

    func configureLabels() {
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityIdentifier = "FirstLabel"
        secondLabel.text = ""
    }
    
    weak var luke: ViewController?
    
    func testing() {
        let ituneOne = iTune(feed: SomeObject(title: "", results: [SomeOtherObject(artistName: "asdf")]))
        
        ituneOne.feed.results.first?.artistName
    }
    
    func decoding() {
        let data = Data()
        do {
            let decodedShowsArray = try JSONDecoder().decode([Show].self, from: data)
        } catch {
            print(error)
        }
    }
    
}

struct Show: Decodable {
    let id: Int?
    let name: String?
}

struct iTune: Encodable & Decodable {
    let feed: SomeObject
}

struct SomeObject: Codable {
    let title: String?
    let results: [SomeOtherObject]
}

struct SomeOtherObject: Codable {
    let artistName: String?
}
