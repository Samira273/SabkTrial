//
//  ImagesAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit
import DateToolsSwift
import Localize_Swift

class ImagesAdaptor: NSObject, UICollectionViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var images: [Comics] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath)
                as? ImagesCollectionViewCell else {
                    return UICollectionViewCell()
            }
            cell.setImageTitle(text: images[indexPath.row].title ?? "")
            cell.setImage(imageUrl: images[indexPath.row].coverPhoto ?? "")
            cell.setTimeApart(text: images[indexPath.row].timeApart ?? "unknown")
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0.85 * collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}
