//
//  ArticlesCollectionViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/24/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var aothorName: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        authorImage.layer.masksToBounds = true
        authorImage.layer.cornerRadius = authorImage.bounds.width / 2
    }

}
