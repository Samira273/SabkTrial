//
//  HeaderSliderCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class HeaderSliderCell: UICollectionViewCell {
    
    @IBOutlet private weak var title: UILabel!
    
    @IBOutlet private weak var timingLabel: UILabel!
    @IBOutlet private weak var hotviewsNumberLabel: UILabel!
    @IBOutlet private weak var discriptionText: UILabel!
    @IBOutlet private weak var coverPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code  
    }
    
    func configureCell(item: Slider, index: Int) {
        
        timingLabel.text = item.timeApart ?? "unknown"
        title.text = item.title ?? ""
        hotviewsNumberLabel.text = "\(item.noOfViews ?? 0)"
        discriptionText.text = item.description?.html2String ?? ""
        coverPhoto.sd_setImage(
            with: URL(string: item.coverPhoto ?? ""),
            placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
}
