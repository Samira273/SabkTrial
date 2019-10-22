//
//  NewsScreenAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit

class NewsScreenAdaptor : NSObject, UITableViewDataSource{
    
    var slidersData : [Slider] = []
    var matrialsData : [Materials] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = Sections(rawValue: section)!
        switch sectionType {
        case .sliderSection :
            return self.slidersData.isEmpty ? 0 : 1
        case .firstNewsSection:
            return self.matrialsData.isEmpty ? 0 : 4
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = Sections(rawValue: indexPath.section)!
        switch sectionType {
        case .sliderSection:
            let cell : SliderSectionCell = tableView.dequeueReusableCell(withIdentifier: "SliderSectionCell", for: indexPath) as! SliderSectionCell
            cell.slidersData = slidersData
            return cell
            
        case .firstNewsSection:
            let cell : NewsSectionCell = tableView.dequeueReusableCell(withIdentifier: "NewsSectionCell", for: indexPath) as! NewsSectionCell
            let article = matrialsData[indexPath.row]
            cell.title.text = article.title
            cell.noOfViews.text = "\(article.noOfViews ?? 0)"
            cell.newsImage.sd_setImage(with: URL(string: article.coverPhoto ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
            if let videosCount = article.videosCount{
                if (videosCount != 0){
                    cell.videoPlay.isHidden = false
                }
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}


