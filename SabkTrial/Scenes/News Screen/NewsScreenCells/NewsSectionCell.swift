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
    
    func configureCell(item: Materials) {
        noOfViews.text = "\(item.noOfViews ?? 0)"
        timeApart.text = item.timeApart ?? ""
        newsImage.sd_setImage(with: URL(
            string: item.coverPhoto ?? ""), placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
        title.text = item.title
        if(item.videosCount ?? 0 > 0) {
                    videoPlay.isHidden = false
        }
    }

}
