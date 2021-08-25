//
//  CastMemberCell.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/24/21.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    
    static let identifier = String(describing: EpisodeCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        episodeName.text = "hello"
    }    
}
