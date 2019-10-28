//
//  VideosCollectionViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var videoTime: UILabel!
    @IBOutlet private weak var videoTitle: UILabel!
    @IBOutlet private weak var videoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setVideoTitle(text: String) {
        videoTitle.text = text
    }
    
    func setVideoImage(imageURL: String) {
      videoImage.sd_setImage(with: URL(string: imageURL), placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }

}
