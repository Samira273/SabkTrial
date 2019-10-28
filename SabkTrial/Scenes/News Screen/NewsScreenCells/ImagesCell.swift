//
//  ImagesCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ImagesCell: UITableViewCell {

    @IBOutlet weak var imagesCollection: UICollectionView!
    let imagesAdaptor = ImagesAdaptor()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagesCollection.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        imagesCollection.delegate = imagesAdaptor
        imagesCollection.dataSource = imagesAdaptor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
