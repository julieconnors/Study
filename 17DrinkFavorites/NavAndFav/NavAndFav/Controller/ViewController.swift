//
//  ViewController.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/24/21.
//

import UIKit

class ViewController: UIViewController {
    var episodeListVM: EpisodeListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetting()
        
        setUpVM()
    }
    
    @IBAction func loadFavorites(_ sender: Any) {
        guard let favoriteVC = storyboard?.instantiateViewController(identifier: "FavoritesVC") as? FavoritesViewController else { return }
        
        guard let episodes = episodeListVM.episodeListModel else { return }
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
    
    func addEpisodes() {
        tableView.reloadData()
    }
    
    func setUpVM() {
        episodeListVM = EpisodeListViewModel()
        
        let updateCompletion = { [weak self] in
            guard let wself = self else { return }
            wself.addEpisodes()
        }
        episodeListVM.bind(completion: updateCompletion)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodeListVM.episodeListModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier) as? EpisodeCell else { fatalError() }
        
        
        guard let episodes = episodeListVM.episodeListModel else {fatalError() }
        let episode = episodes[indexPath.row]
        
        cell.episodeName.text = episode.name
        
        episodeListVM.fetchImage(str: episode.image.medium) { image in
            cell.episodeImageView.image = image
        }
        return cell
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard let episodes = episodeListVM.episodeListModel else {fatalError() }
            let episode = episodes[indexPath.row]
            episodeListVM.fetchImage(str: episode.image.medium, completion: { _ in })
        }
    }
}

extension ViewController: UITableViewDelegate { /// built in delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let episodeVC = storyboard?.instantiateViewController(identifier: "EpisodeVC") as? EpisodeViewController else { return }
        
        episodeVC.favoriteDelegate = self
        
        guard let episodes = episodeListVM.episodeListModel else {fatalError() }
        
        episodeVC.episodeVM = EpisodeViewModel(episode: episodes[indexPath.row])
        
        episodeVC.row = indexPath.row
        
        navigationController?.pushViewController(episodeVC, animated: true)
    }
}

extension ViewController: FavoriteDelegate {
    func changeStatus(status: Bool, row: Int) {
        episodeListVM.episodeListModel?[row].isFavorite = status
    }
}

