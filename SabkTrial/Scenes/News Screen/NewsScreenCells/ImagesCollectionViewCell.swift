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
    
    var item: Comics? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
     private func configureCell() {
        imageTitle.text = item?.title ?? ""
        image.sd_setImage(
            with: URL(string: item?.coverPhoto ?? ""),
            placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
        imageTiming.text = item?.timeApart ?? ""
    }

}
