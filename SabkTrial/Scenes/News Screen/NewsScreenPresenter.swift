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
        self.model = model
        self.view = view
    }
    
    typealias View = NewsScreenViewController
    
    typealias Model = NewsScreenModel

    func loadData(){
        model.loadData()
    }
    
   
}
