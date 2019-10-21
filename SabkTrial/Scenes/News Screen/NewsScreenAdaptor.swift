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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = Sections(rawValue: section)!
        switch sectionType {
        case .sliderSection :
            return 1
        case .firstNewsSection:
            return 4
        default:
         return 10
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
            return cell
        case .firstNewsSection:
            let cell : NewsSectionCell = tableView.dequeueReusableCell(withIdentifier: "NewsSectionCell", for: indexPath) as! NewsSectionCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}

enum Sections : Int, CaseIterable{
    case sliderSection = 0
    case firstNewsSection = 1
    case videoSection = 2
    case latestArticle = 3
    case secondNewsSection = 4
    case photosSlider = 5
    case thirdNewsSection = 6
    case articles = 7
    case forthNewsSection = 8
    case footer = 9
  
}
