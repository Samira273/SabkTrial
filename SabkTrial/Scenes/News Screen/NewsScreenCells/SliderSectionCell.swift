//
//  SliderSectionCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/21/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import SDWebImage

class SliderSectionCell: UITableViewCell,
    UICollectionViewDataSource,
UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidersData.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HeaderSliderCell", for: indexPath)
            as? HeaderSliderCell else {
                return UICollectionViewCell()
        }
        cell.configureCell(item: slidersData[indexPath.row], index: indexPath.row)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    @IBOutlet private weak var sliderCollection: UICollectionView!
    var slidersData = [Slider]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HeaderSliderCell", bundle: nil)
        sliderCollection.register(nib, forCellWithReuseIdentifier: "HeaderSliderCell")
        self.sliderCollection.isPagingEnabled = true
        self.sliderCollection.showsVerticalScrollIndicator = false
        self.sliderCollection.showsHorizontalScrollIndicator = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
