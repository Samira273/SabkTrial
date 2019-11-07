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
    
    func configureCell(item: Comics) {
        videoTitle.text = item.title
        videoImage.sd_setImage(with: URL(string: item.authorImg ?? ""), placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
        videoTime.text = item.timeApart ?? ""
    }
}
