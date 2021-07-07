//
//  ShimmerSliderTableViewCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/30/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ShimmerSliderTableViewCell: UITableViewCell {

    @IBOutlet private weak var tesxtOne: UITextView!
    @IBOutlet private weak var textTwo: UITextView!
    
//    @IBOutlet private weak var monz: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       tesxtOne.windless.apply {
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
        
        textTwo.windless.apply {
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
