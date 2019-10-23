//
//  HomeScreenPresenter.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
class NewsScreenPresenter : BasePresenter, NewsScreenPresenterProtocol{
    
    
    
    typealias View = NewsScreenViewProtocol
    
    typealias Model = NewsScreenModelProtocol
    
    private var view : View
    private var model : Model
    
    init(view: View, model: Model)  {
        self.view = view
        self.model = model
    }
    
    func loadData(){
        model.fetchNewsData(compelation: {success in
            if success{
                self.view.setSliders(sliders: self.model.bringSliders())
                self.view.setMaterials(materials: self.model.bringMaterials())
                
            }else {
                print("fetcing news failed")
            }
        })
        
        model.fetchVideosData(compelation: {success in
            if success{
                self.view.setVideos(videos: self.model.bringVideos())
            }else {
                print("fetcing videos failed")
            }
        })
        
        model.fetchImagesData(compelation: {success in
            if success{
                self.view.setImages(images: self.model.bringImages())
            }else {
                print("fetcing images failed")
            }
        })
        
    }
}

