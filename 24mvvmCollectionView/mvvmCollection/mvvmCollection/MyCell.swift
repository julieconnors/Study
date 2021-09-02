//
//  MyCell.swift
//  mvvmCollection
//
//  Created by Luat on 9/2/21.
//

import UIKit

class MyCell: UICollectionViewCell {

    static let identifier = String(describing: MyCell.self)
    
    @IBOutlet weak var topLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
