//
//  VideosCollectionViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var videoTime: UILabel!
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
