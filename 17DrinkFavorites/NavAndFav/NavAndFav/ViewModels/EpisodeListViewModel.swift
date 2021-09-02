//
//  ViewModel.swift
//  NavAndFav
//
//  Created by Julie Connors on 9/1/21.
//

import Foundation
import UIKit.UIImage

class EpisodeListViewModel {
    let episodeString = "https://api.tvmaze.com/shows/191/episodes"
    
    var episodeListModel: [Episode]? {
        didSet {
            DispatchQueue.main.async {
                self.updateUIClosure?()
            }
        }
    }
    
    func getEpisode(at row: Int) -> Episode {
        guard let episode = episodeListModel?[row] else { fatalError() }
        return episode
       }
    
    init() {
        fetchEpisodes()
    }
        
    func fetchEpisodes() {
        print("fetching")
        guard let url = URL(string: episodeString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        if let episodes = try? JSONDecoder().decode([Episode].self, from: data) {
                print("got data")
            self.episodeListModel = episodes
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
    
    func bind(completion: @escaping () -> Void) {
        self.updateUIClosure = completion
    }
    
    var updateUIClosure: (() -> Void)?
}
