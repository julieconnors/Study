//
//  ViewController.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    var episodes: [Episode] = []
    
    @IBOutlet weak var tableView: UITableView!
            
    let episodeString = "https://api.tvmaze.com/shows/191/episodes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetting()
        retrieveData()
    }
    
    @IBAction func loadFavorites(_ sender: Any) {
        guard let favoriteVC = storyboard?.instantiateViewController(identifier: "FavoritesVC") as? FavoritesViewController else { return }
        
        favoriteVC.favorites = episodes.filter { $0.isFavorite == true }
                
        navigationController?.pushViewController(favoriteVC, animated: true)
    }
    
    func tableSetting() {
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: EpisodeCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: EpisodeCell.identifier)
    }

    func retrieveData(){
        fetchData { episode in
            self.episodes = episode
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchData(completion: @escaping ([Episode]) -> Void) {
        guard let url = URL(string: episodeString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let episodes = try? JSONDecoder().decode([Episode].self, from: data) {
                completion(episodes)
            }
        }.resume()
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier) as? EpisodeCell else { fatalError() }
        
        let episode = self.episodes[indexPath.row]
        
        cell.episodeName.text = self.episodes[indexPath.row].name
        
        fetchImage(str: episode.image.medium) { image in
            cell.episodeImageView.image = image
        }
        return cell
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let episode = episodes[indexPath.row]
            fetchImage(str: episode.image.medium, completion: { _ in })
        }
    }
}

extension ViewController: UITableViewDelegate { /// built in delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let episodeVC = storyboard?.instantiateViewController(identifier: "EpisodeVC") as? EpisodeViewController else { return }
        
        episodeVC.favoriteDelegate = self
        
        episodeVC.episode = episodes[indexPath.row]
        episodeVC.row = indexPath.row
        
        navigationController?.pushViewController(episodeVC, animated: true)
    }
}

extension ViewController: FavoriteDelegate {
    func changeStatus(status: Bool, row: Int) {
        episodes[row].isFavorite = status
    }
}




/*
 [X]1. Create MVC folders
 [X]2. Decode model in model file (swift)
 [X]3. Create custom table cell (cocoa touch)
    [X]- create static method to access identifier
    [X]- create outlets from nib file
 [X]4. Extend view controller with table settings
    [X]- configure table view source
    [X]- register nib with custom cell identifier
 []5. Extend view controller with UITableViewDataSourcePrefetching
    [X]- call fetchData
        [X]- fetchData invokes downloadData with completion escaping closure
            [X]- after data is downloaded, main dispatch queue reloads data
 [X]6. Create cache file (swift)
    [X]- create static instance with private init
    [X]- store data with NSCache class: NSString key(image url, UIImage object)
    [X]- create read and write functions
 [X]7. fetchImage function to find from or add to image cache
 []8. extend view controller with UITableViewDelegate
    []- add didSelectRowAt to navigate to details view
 [X]9. Create new view controller file (cocoa touch)
 [X]10. Add view controller to storyboard with new view controller class
 [X]11. Embed navigation controller to starting(main) view controller
 [X]12. set up storyboard reference in didSelectRowAt with storyboard identifier
    [X]- push new view controller
 [X]13. Add UI objects to new view in storyboard and connect outlets to new view controller
 [X]14. Set up event handlers in new view controller

 */


