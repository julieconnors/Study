//
//  ViewController.swift
//  imageViewCell
//
//  Created by Julie Connors on 8/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    
    var drinkNameArray: [String] = []
    var drinkImageArray: [String] = []
    
    var showNameArray: [String] = []
    var showImageArray: [String] = []
    
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData() {
        fetchDrinks()
        fetchShows()
    }
    
    func fetchDrinks() {
        self.group.enter()
        
        guard let url = URL(string: drinksStr) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
    
            if let drinksDecoded = try? JSONDecoder().decode(Drinks.self, from: data) {
                
                for drink in drinksDecoded.drinks {
                    self.drinkNameArray.append(drink.strDrink)
                    self.drinkImageArray.append(drink.strDrinkThumb)
                }
                self.group.leave()
                }
        }.resume()
    }
    
    func fetchShows() {
        self.group.enter()
        
        guard let url = URL(string: tvShowsStr) else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode([Shows].self, from: data)
                
                for show in decoded {
                    self.showNameArray.append(show.name)
                    self.showImageArray.append(show.image.medium)
                }
                self.group.leave()
            } catch {
                print("no data")
            }
        }.resume()
    }
 
    struct Shows: Decodable {
        let name: String
        var image: ShowImage
    }
    
    struct ShowImage: Decodable {
        let medium: String
        let original: String
    }
    
    struct Drinks: Decodable {
        var drinks: [Drink]
    }
    
    struct Drink: Decodable {
        let strDrink: String
        let strDrinkThumb: String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let drinkVC = segue.destination as? DrinkViewController
        drinkVC?.drinkNameArray += self.drinkNameArray
        drinkVC?.drinkImageArray += self.drinkImageArray
        
        
        let showVC = segue.destination as? ShowViewController
        showVC?.showNameArray += self.showNameArray
        showVC?.showImageArray += self.showImageArray
    }
}

