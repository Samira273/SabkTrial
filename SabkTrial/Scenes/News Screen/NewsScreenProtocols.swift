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
}

protocol NewsScreenModelProtocol:BaseModelProtocol {
    func fetchData(compelation: @escaping (Bool) -> Void)
    func bringsliders() -> [Slider]
    func bringMaterials() -> [Materials]
}

//protocol NewsScreenPresenterAssembable : BasePresenterAssembable{
//    
//}
