//
//  CastMemberViewController.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/24/21.
//

import UIKit
import Foundation

protocol FavoriteDelegate {
    func changeStatus(status: Bool, row: Int)
}

class EpisodeViewController: UIViewController {
    
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var episodeSummary: UILabel!
    
    var row: Int = 0
    var episodeVM: EpisodeViewModel?
    var favoriteDelegate: FavoriteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeName.text = episodeVM?.name
        episodeImageView.image = ImageCache.shared.findImage(str: episodeVM?.image ?? "")
        episodeSeason.text = episodeVM?.season
        episodeSummary.text = episodeVM?.formatSummary
        
        checkStatus()
        addTapToHeartView()
    }
    
    func addTapToHeartView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartImageView.addGestureRecognizer(tap)
        heartImageView.isUserInteractionEnabled = true
    }
        
    @objc func handleTap() {
        if let isFav = episodeVM?.isFavorite {
            episodeVM?.isFavorite = !isFav
            
            checkStatus()
            
            favoriteDelegate?.changeStatus(status: !isFav, row: row)
        }
    }
    
    func checkStatus() {
        if let imageStr = episodeVM?.isFavorite {
            let image = imageStr ? "heart.fill" : "heart"
            
            heartImageView.image = UIImage(systemName: image)
        }
    }
}


