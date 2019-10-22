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
        model.fetchData(compelation: {success in
            if success{
                self.view.setSliders(sliders: self.model.bringsliders())
                self.view.setMaterials(materials: self.model.bringMaterials())
            }else {
                print("fetcing data failed")
            }
        })
    }
}

