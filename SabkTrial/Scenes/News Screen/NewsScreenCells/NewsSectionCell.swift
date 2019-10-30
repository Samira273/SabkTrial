//
//  NewsSectionCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/22/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class NewsSectionCell: UITableViewCell {

    @IBOutlet private weak var noOfViews: UILabel!
    @IBOutlet private weak var videoPlay: UIImageView!
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var timeApart: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNoOfViews(text: String) {
        noOfViews.text = text
    }
    
    func setTimeApart( text: String) {
        timeApart.text = text
    }
    
    func setImage(imageUrl: String) {
        newsImage.sd_setImage(with: URL(
            string: imageUrl), placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
    func setTitle(text: String) {
        title.text = text
    }
    
    func shwoVideoImage(show: Bool) {
        videoPlay.isHidden = show
    }

}
