//
//  HomeScreenModel.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation

class NewsScreenModel: BaseModel, NewsScreenModelProtocol {
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
 
}
