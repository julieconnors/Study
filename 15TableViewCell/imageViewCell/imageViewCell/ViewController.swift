//
//  ViewController.swift
//  imageViewCell
//
//  Created by Julie Connors on 8/20/21.
//

import UIKit

protocol DisplayNameAndImage: Decodable {
    var title: String { get }
    var image: String { get }
    var type: DisplayType { get set }
}

enum DisplayType: Int, Decodable {
    case drink
    case show
}

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    
    var dataArray: [[DisplayNameAndImage]] = []
    var drinkArray: [DrinkDisplayInfo] = []
    var showArray: [ShowDisplayInfo] = []
    
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        fetchData()
    }
    
    func fetchData() {
        fetchDrinks()
        fetchShows()
        
        group.notify(queue: .global()) {
            DispatchQueue.main.async {
                print(self.dataArray)
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchDrinks() {
        self.group.enter()
        
        guard let url = URL(string: drinksStr) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
    
            if let drinksDecoded = try? JSONDecoder().decode(Drinks.self, from: data) {
                
                for drink in drinksDecoded.drinks {
                    self.drinkArray.append(DrinkDisplayInfo(title: drink.strDrink, image: drink.strDrinkThumb, type: .drink))
                }
                self.dataArray.append(self.drinkArray)
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
                    self.showArray.append(ShowDisplayInfo(title: show.name, image: show.image.medium, type: .show))
                }
                self.dataArray.append(self.showArray)
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
    
    struct ShowDisplayInfo: DisplayNameAndImage {
        var title: String
        var image: String
        var type: DisplayType
    }
    
    struct ShowImage: Decodable {
        let medium: String
        let original: String
    }
    
    struct Drinks: Decodable {
        var drinks: [Drink]
    }
    
    struct DrinkDisplayInfo: DisplayNameAndImage {
        var title: String
        var image: String
        var type: DisplayType
        
    }
    
    struct Drink: Decodable {
        let strDrink: String
        let strDrinkThumb: String
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch self.dataArray[section][0].type {
            case .show: return "Shows"
            case .drink: return "Drinks"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            fatalError()
        }

        cell.nameLabel.text = self.dataArray[indexPath.section][indexPath.row].title
        
        if let imageURL = URL(string: dataArray[indexPath.section][indexPath.row].image) {
            URLSession.shared.dataTask(with: imageURL) {data, response, error in
                guard let data = data else { return }
                let image = UIImage(data: data)

                DispatchQueue.main.async {
                    cell.myImageView.image = image
                }
            }.resume()
        }
        return cell
    }
}

