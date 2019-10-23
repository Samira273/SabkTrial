//
//  NewsScreenAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit

class NewsScreenAdaptor : NSObject, UITableViewDataSource, UITableViewDelegate{
    
    var slidersData : [Slider] = []
    var matrialsData : [Materials] = []
    var videosData : [Comics] = []
    var imagesData : [Comics] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = Sections(rawValue: section)!
        switch sectionType {
        case .sliderSection :
            return self.slidersData.isEmpty ? 0 : 1
        case .firstNewsSection:
            return self.matrialsData.isEmpty ? 0 : self.matrialsData.count
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
            let article = matrialsData[indexPath.row]
            if (article.type == "news"){
                let cell : NewsSectionCell = tableView.dequeueReusableCell(withIdentifier: "NewsSectionCell", for: indexPath) as! NewsSectionCell
                
                cell.title.text = article.title
                cell.noOfViews.text = "\(article.noOfViews ?? 0)"
                cell.newsImage.sd_setImage(with: URL(string: article.coverPhoto ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
                if let videosCount = article.videosCount{
                    if (videosCount != 0){
                        cell.videoPlay.isHidden = false
                    }
                }
                return cell
            }
            if (article.type == "videos"){
                let cell : VideosCell = tableView.dequeueReusableCell(withIdentifier: "VideosCell", for: indexPath) as! VideosCell
                
               //i will use the videos array now
                cell.videosAdaptor.videos = videosData
                return cell
            }
            
            if(article.type == "images"){
                let cell : ImagesCell = tableView.dequeueReusableCell(withIdentifier: "ImagesCell", for: indexPath) as! ImagesCell
                cell.imagesAdaptor.images = imagesData
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
            if(matrialsData[indexPath.row].type == "videos"){
                return 400
            }
            if(matrialsData[indexPath.row].type == "images"){
                return 400
            }
            return UITableView.automaticDimension
        }
    }
}


