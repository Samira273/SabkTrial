//
//  ImagesAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit

class ImagesAdaptor : NSObject , UICollectionViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var images : [Comics] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ImagesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell
        cell.imageTitle.text = images[indexPath.row].title
        cell.image.sd_setImage(with: URL(string: images[indexPath.row].coverPhoto ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 0.75 * collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 45
    }
    
}
