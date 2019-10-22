//
//  SliderSectionCell.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/21/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class SliderSectionCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HeaderSliderCell = sliderCollection.dequeueReusableCell(withReuseIdentifier: "HeaderSliderCell", for: indexPath) as! HeaderSliderCell
        let slider = slidersData[indexPath.row]
        cell.title.text = slider.title
        cell.discriptionText.text = slider.description?.html2String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @IBOutlet weak var sliderCollection: UICollectionView!
    var slidersData = [Slider]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "HeaderSliderCell", bundle: nil)
        sliderCollection.register(nib, forCellWithReuseIdentifier: "HeaderSliderCell")
        self.sliderCollection.isPagingEnabled = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
