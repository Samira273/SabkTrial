//
//  ArticlesAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/24/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit

class ArticlesAdaptor: NSObject,
    UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    var articles: [Materials] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ArticlesCollectionViewCell", for: indexPath)
            as? ArticlesCollectionViewCell else {
                return UICollectionViewCell()
        }
        cell.setAuthorName(text: articles[indexPath.row].authorName ?? "")
        cell.setArticleTitle(text: articles[indexPath.row].title ?? "")
       cell.setAuthorImage(imageURL: articles[indexPath.row].authorImg ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0.7 * collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }  
}
