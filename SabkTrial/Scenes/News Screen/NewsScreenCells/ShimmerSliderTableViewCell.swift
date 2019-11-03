//
//  ShimmerSliderTableViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/30/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ShimmerSliderTableViewCell: UITableViewCell {

    @IBOutlet private weak var discrp: UILabel!
    @IBOutlet private weak var title: UILabel!
//    @IBOutlet private weak var monz: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       discrp.windless.apply {
          $0.beginTime = 1
          $0.pauseDuration = 1
          $0.duration = 3
          $0.animationLayerOpacity = 0.8
       }
       .start()

        img.windless.apply {
             $0.beginTime = 1
             $0.pauseDuration = 1
             $0.duration = 3
             $0.animationLayerOpacity = 0.8
        }
        .start()
        
        title.windless.apply {
           $0.beginTime = 1
           $0.pauseDuration = 1
           $0.duration = 3
           $0.animationLayerOpacity = 0.8
        }
        .start()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
