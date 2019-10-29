//
//  HomeScreenModel.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import DateToolsSwift

class NewsScreenModel: BaseModel, NewsScreenModelProtocol {
    
    private var materials: [Materials] = []
    private var sliders: [Slider] = []
    private var images: [Comics] = []
    private var videos: [Comics] = []
    private var articles: [Materials] = []
    
    func fetchNewsData(compelation: @escaping (Bool) -> Void) {
        getNews(compelation: {result in
            switch result {
            case .success(let response):
                let data = response as? SliderMaterialResponse
                if let dataReturned = data {
                    if let slid = dataReturned.slider {
                        self.sliders = slid
                        for index in 0..<self.sliders.count {
                            self.sliders[index].timeApart =
                                self.getTimeApart(forPublishDate: self.sliders[index].publishDate ?? "")
                        }
                    } else {
                        print("ERROR : sliders arent available")
                    }
                    if let material = dataReturned.materials {
                        self.materials = material
                        for index in 0..<self.materials.count {
                            self.materials[index].timeApart =
                                self.getTimeApart(forPublishDate: self.materials[index].publishDate ?? "")
                        }
                        if(!self.videos.isEmpty) {
                            self.materials.insert(Materials(type: Materialtypes.videos), at: 4)
                        }
                        if(!self.images.isEmpty) {
                            self.materials.insert(Materials(type: Materialtypes.images), at: 9)
                        }
                        if(!self.articles.isEmpty) {
                            self.materials.insert(Materials(type: Materialtypes.articles), at: 13)
                        }
                    } else {
                        print("ERROR: Materials arent available")
                    }
                    compelation(true)
                } else {
                    compelation(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getNews(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getNews(completion: {result, _ in
            switch result {
            case .success(let response):
                print(response.code ?? 0)
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func bringSliders() -> [Slider] {
        return sliders
    }
    
    func bringMaterials() -> [Materials] {
        return materials
    }
    
    func fetchVideosData(compelation: @escaping (Bool) -> Void) {
        getVideos(compelation: {result in
            switch result {
            case .success(let response):
                let data = response as? VideosAndImagesResponse
                if let dataReturned = data {
                    if let videosComics = dataReturned.comics {
                        self.videos = videosComics
                        for index in 0..<self.videos.count {
                            self.videos[index].timeApart =
                                self.getTimeApart(forPublishDate: self.videos[index].publishDate ?? "")
                        }
                        if(!self.materials.isEmpty) {
                            if(self.materials[4].type != Materialtypes.videos) {
                                self.materials.insert(Materials(type: Materialtypes.videos), at: 4)
                            }
                        }
                    } else {
                        print("ERROR : videos arent available")
                    }
                    compelation(true)
                } else {
                    compelation(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getVideos(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getVideos(completion: {result, _ in
            switch result {
            case .success(let response):
                print(response.code ?? 0)
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func bringVideos() -> [Comics] {
        return videos
    }
    
    func fetchImagesData(compelation: @escaping (Bool) -> Void) {
        getImages(compelation: {result in
            switch result {
            case .success(let response):
                let data = response as? VideosAndImagesResponse
                if let dataReturned = data {
                    if let imagesComics = dataReturned.comics {
                        self.images = imagesComics
                        for index in 0..<self.images.count {
                            self.images[index].timeApart =
                                self.getTimeApart(forPublishDate: self.images[index].publishDate ?? "")
                        }
                        if(!self.materials.isEmpty) {
                            //check if the 9th element is of type images
                            if(self.materials[9].type != Materialtypes.images) {
                                self.materials.insert(Materials(type: Materialtypes.images), at: 9)
                            }
                        }
                    } else {
                        print("ERROR : images arent available")
                    }
                    compelation(true)
                } else {
                    compelation(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getImages(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getImages(completion: {result, _ in
            switch result {
            case .success(let response):
                print(response.code ?? 0)
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func bringImages() -> [Comics] {
        return images
    }
    
    func fetchArticlesData(compelation: @escaping (Bool) -> Void) {
        getArticles(compelation: {result in
            switch result {
            case .success(let response):
                let data = response as? ArticlesResponse
                if let dataReturned = data {
                    if let articlesMaterial = dataReturned.materials {
                        self.articles = articlesMaterial
                        if(!self.materials.isEmpty) {
                            if(self.materials[13].type != Materialtypes.articles) {
                                self.materials.insert(Materials(type: Materialtypes.articles), at: 13)
                            }
                        }
                    } else {
                        print("ERROR : articles arent available")
                    }
                    compelation(true)
                } else {
                    compelation(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getArticles(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getArticles(completion: {result, _ in
            switch result {
            case .success(let response):
                print(response.code ?? 0)
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func bringArticles() -> [Materials] {
        return articles
    }
    
    func getTimeApart(forPublishDate: String) -> String {
        var timeApart = ""
        if (forPublishDate != "") {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm ss"
            let publishingDate: Date = dateFormatter.date(from: forPublishDate ) ?? Date()
            let current: String = dateFormatter.string(from: Date())
            let currentDate: Date = dateFormatter.date(from: current) ?? Date()
            let timeDifference = TimePeriod(beginning: publishingDate, end: currentDate)
            if(timeDifference.years > 0) {
                timeApart = timeDifference.years.years.earlier.timeAgoSinceNow
            } else if (timeDifference.days > 30) {
                let months = abs(timeDifference.days / 30 )
                timeApart = months.months.earlier.timeAgoSinceNow
            } else {
                timeApart = timeDifference.days.days.earlier.timeAgoSinceNow
            }
            
        }
        return timeApart
    }
}
