//
//  ShowViewController.swift
//  imageViewCell
//
//  Created by Julie Connors on 8/22/21.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var showNameArray: [String] = []
    var showImageArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let myCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { fatalError() }
        
        myCell.nameLabel.text = self.showNameArray[indexPath.row]
        
        if let imageURL = URL(string: showImageArray[indexPath.row]) {
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
