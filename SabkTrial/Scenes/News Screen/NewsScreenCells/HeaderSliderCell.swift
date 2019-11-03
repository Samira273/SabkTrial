//
//  HeaderSliderCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class HeaderSliderCell: UICollectionViewCell {

    @IBOutlet private weak var sliderPager: UIPageControl!
    @IBOutlet private weak var title: UITextView!
    @IBOutlet private weak var timingLabel: UILabel!
    @IBOutlet private weak var hotviewsNumberLabel: UILabel!
    @IBOutlet private weak var discriptionText: UILabel!
    @IBOutlet private weak var coverPhoto: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sliderPager.numberOfPages = 5

    }
    
    func setCurrentPage(page: Int) {
        sliderPager.currentPage = page
    }
    
    func setTimeApart(text: String) {
        timingLabel.text = text
    }
    
    func setTitle(text: String) {
        title.text = text
    }
    
    func setHotViewsNumber(text: String) {
        hotviewsNumberLabel.text = text
    }

    func setDescription(text: String) {
        discriptionText.text = text
    }
    
    func setCoverPhoto(imageURL: String) {
       coverPhoto.sd_setImage(
            with: URL(string: imageURL),
            placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
}
