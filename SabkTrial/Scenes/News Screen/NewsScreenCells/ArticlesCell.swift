//
//  ArticlesCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/24/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ArticlesCell: UITableViewCell {

    @IBOutlet weak var articlesCollection: UICollectionView!
    let articlesAdaptor = ArticlesAdaptor()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        articlesCollection.register(UINib(nibName: "ArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticlesCollectionViewCell")
        articlesCollection.dataSource = articlesAdaptor
        articlesCollection.delegate = articlesAdaptor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
