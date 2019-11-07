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
        return CGSize(width: UIScreen.main.bounds.size.width, height: 450)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    @IBOutlet private weak var sliderCollection: UICollectionView!
    var slidersData = [Slider]()

    @IBOutlet weak private var sliderPager: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HeaderSliderCell", bundle: nil)
        sliderCollection.register(nib, forCellWithReuseIdentifier: "HeaderSliderCell")
        self.sliderCollection.isPagingEnabled = true
        self.sliderCollection.showsVerticalScrollIndicator = false
        self.sliderCollection.showsHorizontalScrollIndicator = false
        sliderPager.numberOfPages = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2),
                             y: (scrollView.frame.height / 2))
        if let index = sliderCollection.indexPathForItem(at: center) {
            self.sliderPager.currentPage = index.row
        }
    }

}
