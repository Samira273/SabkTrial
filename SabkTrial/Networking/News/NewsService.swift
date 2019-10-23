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
    case images
    case videos
}

extension NewsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .slider:
            return "material/homepage-light-version/"
        case .images:
            return "studio/list-studio/"
        case .videos:
            return "studio/list-studio/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .slider:
            return .get
        case .images:
            return .get
        case .videos:
            return .get
        }
        
    }
    
    var sampleData: Data {
        switch self {
        case .slider:
            return Data()
        case .images:
            return Data()
        case .videos:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .slider :
            return .requestParameters(parameters: ["" : ""], encoding: URLEncoding.default)
        case .images :
            return .requestParameters(parameters: ["type" : "image"], encoding: URLEncoding.default)
        case .videos :
            return .requestParameters(parameters: ["type" : "video"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["X-Api-Key":NetworkManager.shared.networkConfig.apiKey]
    }
}

