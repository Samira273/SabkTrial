//
//  HomeScreenProtocols.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation


import Foundation
protocol NewsScreenPresenterProtocol: BasePresenterProtocol {
   
}

protocol NewsScreenViewProtocol:BaseViewProtocol {
    func setSliders(sliders : [Slider]) -> Void
    func setMaterials(materials : [Materials]) -> Void
    func setVideos(videos : [Comics]) -> Void
    func setImages(images: [Comics]) -> Void
    func setArticles(articles : [Materials]) -> Void
}

protocol NewsScreenModelProtocol:BaseModelProtocol {
    func fetchNewsData(compelation: @escaping (Bool) -> Void)
    func fetchVideosData(compelation: @escaping (Bool) -> Void)
    func fetchImagesData(compelation: @escaping (Bool) -> Void)
    func fetchArticlesData(compelation: @escaping (Bool) -> Void)
    func bringSliders() -> [Slider]
    func bringMaterials() -> [Materials]
    func bringVideos() -> [Comics]
    func bringImages() -> [Comics]
    func bringArticles() -> [Materials] 
}

//protocol NewsScreenPresenterAssembable : BasePresenterAssembable{
//    
//}
