//
//  ViewController.swift
//  tableViewPractice
//
//  Created by Julie Connors on 8/17/21.
//

import UIKit

protocol Displayable: Decodable {
    var name: String { get }
}

class ViewController: UITableViewController {
    
    let jokesStr = "https://api.chucknorris.io/jokes/random"
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    
    let group = DispatchGroup()

    var assortedDataArray: [[Displayable]] = []
    
    var jokesList: [Joke] = []

    let decoder = JSONDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.global().async {
            self.fetchDrinks()
            self.fetchJokes()
            self.fetchShows()
        }
        
        self.group.notify(queue: DispatchQueue.global()) {
            self.assortedDataArray.append(self.jokesList)
        
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchDrinks() {
        self.group.enter()

        if let url = URL(string: drinksStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                if let data = data {
                    if let drinksDecoded = try? self.decoder.decode(Drinks.self, from:data){
                        self.assortedDataArray.append(drinksDecoded.drinks)
                        self.group.leave()
                    }
                }
            })
            task.resume()
        }
    }
    
    func fetchShows() {
        self.group.enter()
        
        if let url = URL(string: tvShowsStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                if let data = data {
                    if let shows = try? self.decoder.decode([Shows].self, from: data) {
                        self.assortedDataArray.append(shows)
                        self.group.leave()
                    }
                }
            })
        task.resume()
        }
    }
    
    func fetchJokes() {
        for _ in 0...2 {
            self.group.enter()
            
            if let url = URL(string: jokesStr) {
                let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                    if let data = data {
                        if let joke = try? self.decoder.decode(Joke.self, from: data) {
                            self.jokesList.append(joke)
                        }
                        self.group.leave()
                    }
                })
            task.resume()
            }
        }
    }
    
    struct Shows: Displayable {
        var name: String
        let airdate: String
    }
    
    struct Drinks: Decodable {
        let drinks: [Drink]
    }
    
    struct Drink: Displayable {
        let strDrink: String
       
        var name: String { return strDrink }
    }
    
    struct Joke: Displayable {
        let value: String
        
        var name: String { return value }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0: return "Shows"
            case 1: return "Drinks"
            case 2: return "Jokes"
            default: return "no title"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return assortedDataArray.count
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if assortedDataArray[section].count > 10 {
            return 10
        }
        return assortedDataArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as? MyTableViewCell else {
            fatalError()
        }
        
        cell.name.text = assortedDataArray[indexPath.section][indexPath.row].name
        
        cell.sectionRow.text = "\(indexPath.section): \(indexPath.row)"
        
        return cell
    }
}

