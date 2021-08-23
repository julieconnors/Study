//
//  ViewController.swift
//  singletonPractice
//
//  Created by Julie Connors on 8/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    
    var shows: [Shows] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetting()
        fetchData()
    }

    func fetchData() {
        fetchShows { shows in
            self.shows = shows
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchShows(completionClosure: @escaping ([Shows]) -> Void) {
        guard let url = URL(string: tvShowsStr) else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { fatalError() }
            if let showsDecoded = try? JSONDecoder().decode([Shows].self, from: data) {
                completionClosure(showsDecoded)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableSetting() {
        tableView.dataSource = self
        let nib = UINib(nibName: myShowCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: myShowCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myShowCell.identifier) as? myShowCell else { fatalError() }
        
        cell.showLabel.text = self.shows[indexPath.row].name
        
        let image = self.shows[indexPath.row].image.medium
        fetchImage(imageString: image) { image in
            cell.showImageView.image = image
        }
        
        return cell
    }
    
    func fetchImage(imageString: String, completionClosure: @escaping (UIImage?) -> Void){
        if let image = ShowImageCache.shared.findImage(imageString: imageString) {
            completionClosure(image)
        } else {
            guard let url = URL(string: imageString) else { fatalError() }
            
            URLSession.shared.dataTask(with: url) {data, response, error in
                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        ShowImageCache.shared.addImage(imageString: imageString, image: image)
                        completionClosure(image)
                    }
                }
            }.resume()
        }
    }
}



/*
 [X]1. Create MVC folders
 [X]2. Decode models in model files (swift)
 [X]3. Create custom table cell (cocoa touch)
    [X]- create static method to access identifier
    [X]- create outlets from nib file
 [X]4. Extend view controller with table settings
    [X]- configure table view source
    [X]- register nib with custom cell identifier
 [X]5. Create cache file (swift)
    [X]- create static instance with private init
    [X]- store data with NSCache class: NSString key(image url, UIImage object)
    [X]- create read and write functions
 */

