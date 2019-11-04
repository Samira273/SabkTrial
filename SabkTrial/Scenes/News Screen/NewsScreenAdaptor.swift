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
            return self.slidersData.isEmpty ? 1 : 1
        case .firstNewsSection:
            return self.matrialsData.isEmpty ? 5 : 20
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func constructSliderCell(table: UITableView, index: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "SliderSectionCell", for: index)
            as? SliderSectionCell else { return UITableViewCell() }
        cell.slidersData = slidersData
        return cell
    }
    
    func constructNewsCell(article: Materials, index: IndexPath, table: UITableView ) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "NewsSectionCell", for: index)
            as? NewsSectionCell else { return UITableViewCell() }
        cell.configureCell(item: article)
        return cell
    }
    
    func constructVideosCell(index: IndexPath, table: UITableView) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(
            withIdentifier: "VideosCell", for: index)
            as? VideosCell else {
                return UITableViewCell()
        }
        cell.videosAdaptor.videos = videosData
        return cell
    }
    
    func constructImagesCell(index: IndexPath, table: UITableView) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(
            withIdentifier: "ImagesCell", for: index)
            as? ImagesCell else {
                return UITableViewCell()
        }
        cell.imagesAdaptor.images = imagesData
        return cell
    }
    
    func constructArticlesCell(index: IndexPath, table: UITableView) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(
            withIdentifier: "ArticlesCell", for: index)
            as? ArticlesCell else {
                return UITableViewCell()
        }
        cell.articlesAdaptor.articles = articlesData
        return cell
    }
    
    func prepareShimmerForSection(index: IndexPath, table: UITableView) -> UITableViewCell {
        if let shimmerSectionType = Sections(rawValue: index.section) {
            switch shimmerSectionType {
            case .sliderSection:
                guard let cell = table.dequeueReusableCell(
                    withIdentifier: "ShimmerSliderTableViewCell",
                    for: index) as? ShimmerSliderTableViewCell else {
                        return UITableViewCell()}
                return cell
            case .firstNewsSection:
                guard let cell = table.dequeueReusableCell(
                    withIdentifier: "ShimmerNewsTableViewCell",
                    for: index) as? ShimmerNewsTableViewCell else {
                        return UITableViewCell()}
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            if(matrialsData.isEmpty) {
                return prepareShimmerForSection(index: indexPath, table: tableView)
            }
            
            if let sectionType = Sections(rawValue: indexPath.section) {
                switch sectionType {
                case .sliderSection:
                    return constructSliderCell(table: tableView, index: indexPath)
                case .firstNewsSection:
                    let article = matrialsData[indexPath.row]
                    if (article.type == Materialtypes.news) {
                        return constructNewsCell(
                            article:
                            matrialsData[indexPath.row],
                            index: indexPath,
                            table: tableView)
                    }
                    if (article.type == Materialtypes.videos) {
                        return constructVideosCell(index: indexPath, table: tableView)
                    }
                    if(article.type == Materialtypes.images) {
                        return constructImagesCell(index: indexPath, table: tableView)
                    }
                    if(article.type == Materialtypes.articles) {
                        return constructArticlesCell(index: indexPath, table: tableView)
                    }
                }
            }
            
            return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.matrialsData.isEmpty {
            return UITableView.automaticDimension
        }
        if let sectionType = Sections(rawValue: indexPath.section) {
            switch sectionType {
            case .sliderSection:
                return tableView.frame.size.height * 0.75
            case .firstNewsSection:
                let cellType = matrialsData[indexPath.row].type
                switch cellType {
                case .news:
                    return UITableView.automaticDimension
                case .images:
                    return tableView.frame.size.height * 0.6
                case .articles:
                    return tableView.frame.size.height * 0.5
                case .videos:
                    return tableView.frame.size.height * 0.7
                }
            }
        }
        return UITableView.automaticDimension
    }
}
