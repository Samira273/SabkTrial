//
//  HomeScreenProtocols.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation

protocol NewsScreenPresenterProtocol: BasePresenterProtocol {

}

protocol NewsScreenViewProtocol: BaseViewProtocol {
    func setSliders(sliders: [Slider])
    func setMaterials(materials: [Materials])
    func setVideos(videos: [Comics])
    func setImages(images: [Comics])
    func setArticles(articles: [Materials])
}

protocol NewsScreenModelProtocol: BaseModelProtocol {
    func fetchNewsData(compelation: @escaping (Bool) -> Void)
    func fetchVideosData(compelation: @escaping (Bool) -> Void)
    func fetchImagesData(compelation: @escaping (Bool) -> Void)
    func fetchArticlesData(compelation: @escaping (Bool) -> Void)
    func getSliders() -> [Slider]
    func getMaterials() -> [Materials]
    func getVideos() -> [Comics]
    func bringImages() -> [Comics]
    func bringArticles() -> [Materials]
}

//protocol NewsScreenPresenterAssembable : BasePresenterAssembable{
//
//}
