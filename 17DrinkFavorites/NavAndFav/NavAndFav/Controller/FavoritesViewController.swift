//
//  FavoritesViewController.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/25/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favorites: [Episode] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: EpisodeCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: EpisodeCell.identifier)
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier) as? EpisodeCell else { fatalError() }
        
        let episode = self.favorites[indexPath.row]
        
        cell.episodeName.text = episode.name
        
        fetchImage(str: episode.image.medium) { image in
            cell.episodeImageView.image = image
        }
        
        return cell
    }
    
    func fetchImage(str: String, completion: @escaping (UIImage?) -> Void) {
        if let image = ImageCache.shared.findImage(str: str) {
            completion(image)
        } else {
            guard let url = URL(string: str) else { fatalError() }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        ImageCache.shared.addImage(str: str, image: image)
                        completion(image)
                    }
                }
            }.resume()
        }
    }
}
