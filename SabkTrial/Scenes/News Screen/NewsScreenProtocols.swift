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
    func loadData() 
    
}

protocol NewsScreenViewProtocol:BaseViewProtocol {
    
}

protocol NewsScreenModelProtocol:BaseModelProtocol {
    func getNews( compelation: @escaping (Result<Any,Error>) -> Void)
}

protocol NewsScreenPresenterAssembable : BasePresenterAssembable{
    
}
