//
//  StaticHeaderPlugin.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import Moya

public struct StaticHeaderPlugin: PluginType {
    
    var headers: [String: String] = [:]
    public init(headers: [String: String]) {
        self.headers = headers
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        
        headers.forEach { (key,value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
