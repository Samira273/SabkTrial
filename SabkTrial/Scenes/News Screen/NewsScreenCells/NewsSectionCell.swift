//
//  NewsSectionCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/22/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class NewsSectionCell: UITableViewCell {

    @IBOutlet weak var noOfViews: UILabel!
    @IBOutlet weak var videoPlay: UIImageView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
