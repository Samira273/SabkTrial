//
//  ImagesCollectionViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageTitle: UILabel!
    @IBOutlet private weak var imageTiming: UILabel!
    @IBOutlet private weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImageTitle(text: String) {
        imageTitle.text = text
    }
    
    func setImage(imageUrl: String) {
        image.sd_setImage(
            with: URL(string: imageUrl),
            placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
    func setTimeApart(text: String) {
        imageTiming.text = text
    }

}
