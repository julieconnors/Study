//
//  myShowCell.swift
//  singletonPractice
//
//  Created by Julie Connors on 8/23/21.
//

import UIKit

class myShowCell: UITableViewCell {
    
    @IBOutlet weak var showLabel: UILabel!

    @IBOutlet weak var showImageView: UIImageView!
    
    static let identifier = String(describing: myShowCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showLabel.text = "Name"
    }
}
