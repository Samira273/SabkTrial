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
    
    func setAuthorName(text: String) {
        authorName.text = text
    }
    
    func setArticleTitle(text: String) {
        articleTitle.text = text
    }
    
    func setAuthorImage(imageURL: String) {
      authorImage.sd_setImage(
            with: URL(string: imageURL),
            placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
}
