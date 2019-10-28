//
//  NewsScreenAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit

class NewsScreenAdaptor: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var slidersData: [Slider] = []
    var matrialsData: [Materials] = []
    var videosData: [Comics] = []
    var imagesData: [Comics] = []
    var articlesData: [Materials] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = Sections(rawValue: section) else { return 0
        }
        switch sectionType {
        case .sliderSection :
            return self.slidersData.isEmpty ? 0 : 1
        case .firstNewsSection:
            return self.matrialsData.isEmpty ? 0 : 20
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = Sections(rawValue: indexPath.section)!
        switch sectionType {
        case .sliderSection:
            let cell: SliderSectionCell =
                tableView.dequeueReusableCell(withIdentifier: "SliderSectionCell", for: indexPath)
                    as! SliderSectionCell
            cell.slidersData = slidersData
            return cell
        case .firstNewsSection:
            let article = matrialsData[indexPath.row]
            if (article.type == Materialtypes.news) {
                let cell: NewsSectionCell = tableView.dequeueReusableCell(withIdentifier: "NewsSectionCell", for: indexPath) as! NewsSectionCell
                
                cell.title.text = article.title
                cell.noOfViews.text = "\(article.noOfViews ?? 0)"
                cell.newsImage.sd_setImage(with: URL(string: article.coverPhoto ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
                if let videosCount = article.videosCount {
                    if (videosCount != 0) {
                        cell.videoPlay.isHidden = false
                    }
                }
                return cell
            }
            if (article.type == Materialtypes.videos) {
                let cell: VideosCell = tableView.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
                
                //i will use the videos array now
                cell.videosAdaptor.videos = videosData
                return cell
            }
            if(article.type == Materialtypes.images) {
                let cell: ImagesCell = tableView.dequeueReusableCell(withIdentifier: "ImagesCell", for: indexPath) as! ImagesCell
                cell.imagesAdaptor.images = imagesData
                return cell
            }
            if(article.type == Materialtypes.articles) {
                let cell: ArticlesCell = tableView.dequeueReusableCell(withIdentifier: "ArticlesCell", for: indexPath) as! ArticlesCell
                cell.articlesAdaptor.articles = articlesData
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = Sections(rawValue: indexPath.section)!
        switch sectionType {
        case .sliderSection:
            return 400
        case .firstNewsSection:
            let cellType = matrialsData[indexPath.row].type
            switch cellType {
            case .news:
                return UITableView.automaticDimension
            case .images:
                return 400
            case .articles:
                return 250
            case .videos:
                return 400
            }
        }
    }
}
