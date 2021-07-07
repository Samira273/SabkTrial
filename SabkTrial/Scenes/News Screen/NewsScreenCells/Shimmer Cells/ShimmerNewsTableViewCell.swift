//
//  ShimmerNewsTableViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/30/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ShimmerNewsTableViewCell: UITableViewCell {

    @IBOutlet private weak var img: UIImageView!
//    @IBOutlet private weak var labelTwo: UILabel!
//    @IBOutlet private weak var labelThree: UILabel!
  
    @IBOutlet weak private var textOne: UITextView!
    
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      img.windless.apply {
          $0.beginTime = 1
          $0.pauseDuration = 1
          $0.duration = 3
          $0.animationLayerOpacity = 0.8
      }
      .start()
        
    textOne.windless.apply {
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
