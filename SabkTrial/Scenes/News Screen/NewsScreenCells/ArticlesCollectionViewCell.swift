//
//  ArticlesCollectionViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/24/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var authorImage: UIImageView!
    @IBOutlet private weak var articleTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        authorImage.layer.masksToBounds = true
        authorImage.layer.cornerRadius = authorImage.bounds.width / 2
    }
    
    func configureCell(item: Materials) {
        authorName.text = item.authorName
        articleTitle.text = item.title
        authorImage.sd_setImage(
            with: URL(string: item.authorImg ?? ""),
            placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
}
