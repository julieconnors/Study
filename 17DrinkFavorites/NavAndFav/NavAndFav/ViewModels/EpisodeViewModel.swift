//
//  EpisodeViewModel.swift
//  NavAndFav
//
//  Created by Julie Connors on 9/1/21.
//

import Foundation

class EpisodeViewModel {
    
    var episodeModel: Episode {
        didSet {
            DispatchQueue.main.async {
                self.updateUIClosure?()
            }            
        }
    }

    init(episode: Episode) {
        self.episodeModel = episode
    }

    func bind(completion: @escaping () -> Void) {
        self.updateUIClosure = completion
    }

    var updateUIClosure: (() -> Void)?
    
    var formatSummary: String {
        let start = episodeModel.summary.startIndex
    
        for _ in 0...2 {
            episodeModel.summary.remove(at: start)
        }

        for _ in 0...3 {
            episodeModel.summary.removeLast()
        }
        return episodeModel.summary
    }
        
    var season: String {
        "Season: \(episodeModel.season)"
    }
    
    var name: String {
        episodeModel.name
    }
    
    var image: String {
        episodeModel.image.medium
    }
    
    var isFavorite: Bool {
        get {
            episodeModel.isFavorite
        }
        set {
            episodeModel.isFavorite = newValue
        }
    }
}
