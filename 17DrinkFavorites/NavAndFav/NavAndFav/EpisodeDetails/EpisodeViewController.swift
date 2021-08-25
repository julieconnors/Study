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
    var episode: Episode?
    var favoriteDelegate: FavoriteDelegate?
    
    var isFavorite: Bool {
        get {
            episode?.isFavorite ?? false
        }
        set {
            episode?.isFavorite = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeName.text = episode?.name
        episodeImageView.image = ImageCache.shared.findImage(str: episode?.image.medium ?? "")
        episodeSeason.text = "Season: \(episode?.season ?? 0)"
        episodeSummary.text = formatSummary()
        
        checkStatus()
        addTapToHeartView()
    }
    
    func formatSummary() -> String {
        guard var summary = episode?.summary else { fatalError() }
        let start = summary.startIndex
        
        for _ in 0...2 {
            summary.remove(at: start)
        }

        for _ in 0...3 {
            summary.removeLast()
        }
        return summary
    }
    
    func addTapToHeartView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        heartImageView.addGestureRecognizer(tap)
        heartImageView.isUserInteractionEnabled = true
    }
        
    @objc func handleTap() {
        isFavorite = !isFavorite

        checkStatus()
        
        favoriteDelegate?.changeStatus(status: isFavorite, row: row)
    }
    
    func checkStatus() {
        let imageStr = isFavorite ? "heart.fill" : "heart"
        heartImageView.image = UIImage(systemName: imageStr)
    }
}


