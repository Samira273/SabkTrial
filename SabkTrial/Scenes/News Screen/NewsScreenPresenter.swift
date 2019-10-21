//
//  HomeScreenPresenter.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
class NewsScreenPresenter : BasePresenter, NewsScreenPresenterProtocol, NewsScreenPresenterAssembable{
    
    var view: NewsScreenViewController?
    
    var model: NewsScreenModel
    
    required init(view: NewsScreenViewController, model: NewsScreenModel) {
        self.view = view
        self.model = model
    }
    
  
    
    typealias View = NewsScreenViewController
    
    typealias Model = NewsScreenModel
    
    func loadData(){
        model.getNews(compelation: {result in
            switch result{
            case .success(let response):
                    let data = response as? SliderMaterialResponse
                print(data?.code ?? 0)
            case .failure(let error):
            self.view?.showErrorMessage(title: error.localizedDescription , message: "Network error")
            }
        })
    }
    
}
