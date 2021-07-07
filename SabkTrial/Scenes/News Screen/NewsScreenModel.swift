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
    
    //Slider and Materials request
    
    func fetchNewsData(compelation: @escaping (Bool) -> Void) {
        getNews(compelation: {result in
            switch result {
            case .success(let response):
                self.setNews(dataResponse: response, compelation: { result in compelation(result) })
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getNews(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getDataOf(target: NewsService.slider, completion: {result, _ in
            switch result {
            case .success(let response):
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func setNews(dataResponse: Any, compelation: @escaping (Bool) -> Void) {
        do {
            if let data = dataResponse as? Data {
                let responseData = try JSONDecoder().decode(SliderMaterialResponse.self, from: data )
                
                if let slid = responseData.slider {
                    self.sliders = slid
                    self.setTimeApartForSliders()
                } else {
                    print("ERROR : sliders arent available")
                }
                if let material = responseData.materials {
                    self.materials = material
                    self.setTimeApartForMaterials()
                    self.checkForInsertion()
                } else {
                    print("ERROR: Materials arent available")
                }
                compelation(true)
                
            } else {
                compelation(false)
            }
        } catch {
            compelation(false)
        }
    }
    
    func getSliders() -> [Slider] {
        return sliders
    }
    
    func getMaterials() -> [Materials] {
        return materials
    }
    
    //Videos request
    
    func fetchVideosData(compelation: @escaping (Bool) -> Void) {
        getVideos(compelation: {result in
            switch result {
            case .success(let response):
                self.setVideos(dataResponse: response, compelation: { result in compelation(result) })
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getVideos(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getDataOf(target: NewsService.videos, completion: {result, _ in
            switch result {
            case .success(let response):
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func setVideos(dataResponse: Any, compelation: @escaping (Bool) -> Void) {
        do {
            if let data = dataResponse as? Data {
                let responseData = try JSONDecoder().decode(VideosAndImagesResponse.self, from: data )
                if let videosComics = responseData.comics {
                    self.videos = videosComics
                    self.setTimeApartForVideos()
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
        } catch {
            compelation(false)
        }
    }
    
    func getVideos() -> [Comics] {
        return videos
    }
    
    // images request
    func fetchImagesData(compelation: @escaping (Bool) -> Void) {
        getImages(compelation: {result in
            switch result {
            case .success(let response):
               self.setImages(dataResponse: response, compelation: { result in compelation(result) })
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getImages(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getDataOf(target: NewsService.images, completion: {result, _ in
            switch result {
            case .success(let response):
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func setImages(dataResponse: Any, compelation: @escaping (Bool) -> Void) {
      do {
                         if let data = dataResponse as? Data {
                             let responseData = try JSONDecoder().decode(VideosAndImagesResponse.self, from: data )
                             if let imagesComics = responseData.comics {
                                 self.images = imagesComics
                                 self.setTimeApartForImages()
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
                             
                         }
                     } catch {
                         compelation(false)
                     }
    }
    
    func bringImages() -> [Comics] {
        return images
    }
    
    // Articles request
    func fetchArticlesData(compelation: @escaping (Bool) -> Void) {
        getArticles(compelation: {result in
            switch result {
            case .success(let response):
              self.setAricles(dataResponse: response, compelation: { result in compelation(result) })
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getArticles(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getDataOf(target: NewsService.articles, completion: {result, _ in
            switch result {
            case .success(let response):
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func setAricles(dataResponse: Any, compelation: @escaping (Bool) -> Void) {
     do {
                        if let data = dataResponse as? Data {
                            let responseData = try JSONDecoder().decode(ArticlesResponse.self, from: data )
                            if let articlesMaterial = responseData.materials {
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
                    } catch {
                        compelation(false)
                    }
      }
    
    func bringArticles() -> [Materials] {
        return articles
    }
    // setting Time apart
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
    
    func setTimeApartForVideos() {
        for index in 0..<self.videos.count {
            self.videos[index].timeApart =
                self.getTimeApart(forPublishDate: self.videos[index].publishDate ?? "")
        }
    }
    
    func setTimeApartForSliders() {
        for index in 0..<self.sliders.count {
            self.sliders[index].timeApart =
                self.getTimeApart(forPublishDate: self.sliders[index].publishDate ?? "")
        }
    }
    
    func setTimeApartForMaterials() {
        for index in 0..<self.materials.count {
            self.materials[index].timeApart =
                self.getTimeApart(forPublishDate: self.materials[index].publishDate ?? "")
        }
    }
    
    func setTimeApartForImages() {
        for index in 0..<self.images.count {
            self.images[index].timeApart =
                self.getTimeApart(forPublishDate: self.images[index].publishDate ?? "")
        }
    }
    
    //checking for inserions dummy objects of materials
    func checkForInsertion() {
        if(!self.videos.isEmpty) {
            self.materials.insert(Materials(type: Materialtypes.videos), at: 4)
        }
        if(!self.images.isEmpty) {
            self.materials.insert(Materials(type: Materialtypes.images), at: 9)
        }
        if(!self.articles.isEmpty) {
            self.materials.insert(Materials(type: Materialtypes.articles), at: 13)
        }
    }
}
