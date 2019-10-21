//
//  NetworkManager.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import Moya

/// Closure to be executed when a request has completed.
typealias StatusCode = Int
//typealias NetworkResult<T: Codable> =  Swift.Result<T, NetworkError>
//typealias Completion<T: Codable> = (_ result:NetworkResult<T>, _ statusCode:StatusCode) -> Void

class NetworkManager {
    
    static var shared: NetworkManager!
    
    var networkConfig: NetworkDefaults!
    
    let provider: MoyaProvider<MultiTarget>
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config
        
//        let headerPlugin = StaticHeaderPlugin(
//            headers: [:])
        provider = MoyaProvider<MultiTarget>()
//        provider = MoyaProvider<MultiTarget>(//manager: ,
//            plugins: [headerPlugin, NetworkLoggerPlugin(verbose: true)])
     
    }
    
}
