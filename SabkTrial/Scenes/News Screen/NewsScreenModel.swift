//
//  HomeScreenModel.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation

class NewsScreenModel: BaseModel, NewsScreenModelProtocol {
 
    private var materials : [Materials] = []
    private var sliders : [Slider] = []

    func fetchData(compelation: @escaping (Bool) -> Void){
        getNews(compelation: {result in
            switch result{
            case .success(let response):
                let data = response as? SliderMaterialResponse
                if let dataReturned = data{
                    if let slid = dataReturned.slider{
                        self.sliders = slid
                    }else {
                        print("ERROR : sliders arent available")
                    }
                    if let material = dataReturned.materials{
                        self.materials = material
                    }else{
                        print("ERROR: Materials arent available")
                    }
                    compelation(true)
                }else {
                    compelation(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                compelation(false)
            }
        })
    }
    
    func getNews(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getNews(completion: {result, status in
            switch result{
            case .success(let response):
                print(response.code ?? 0)
                compelation(.success(response))
            case .failure(let error):
                compelation(.failure(error))
            }
        })
    }
    
    func bringsliders() -> [Slider] {
        return sliders
    }
    
    func bringMaterials() -> [Materials] {
        return materials
    }
}


