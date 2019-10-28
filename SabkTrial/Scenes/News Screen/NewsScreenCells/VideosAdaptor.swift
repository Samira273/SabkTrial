//
//  VideosAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class VideosAdaptor: NSObject, UICollectionViewDataSource {

    var videos: [Comics] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: VideosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell", for: indexPath) as! VideosCollectionViewCell
        cell.videoTitle.text = videos[indexPath.row].title
        cell.videoImage.sd_setImage(with: URL(string: videos[indexPath.row].authorImg ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
        return cell
    }

}
