//
//  NewsService.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/21/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import Moya

enum  NewsService {
    case slider
}

extension NewsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .slider:
            return "material/homepage-light-version/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .slider:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .slider:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .slider :
            return .requestParameters(parameters: ["" : ""], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["X-Api-Key":NetworkManager.shared.networkConfig.apiKey]
    }
}

