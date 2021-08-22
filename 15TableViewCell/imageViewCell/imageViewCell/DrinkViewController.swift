//
//  DrinkViewController.swift
//  imageViewCell
//
//  Created by Julie Connors on 8/22/21.
//

import UIKit

class DrinkViewController: UIViewController, UITableViewDataSource {
    
    var drinkNameArray: [String] = []
    var drinkImageArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { fatalError() }
        
        myCell.nameLabel.text = self.drinkNameArray[indexPath.row]
        
        if let imageURL = URL(string: drinkImageArray[indexPath.row]) {
            URLSession.shared.dataTask(with: imageURL) {data, response, error in
                guard let data = data else { return }
                
                let image = UIImage(data: data)
        
                DispatchQueue.main.async {
                    myCell.myImageView.image = image
                }
            }.resume()
        }
        return myCell
    }
}
