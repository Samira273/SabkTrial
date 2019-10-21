//
//  NetworkDefaults.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
struct NetworkDefaults {
    var baseUrl: String = ""
    var apiKey: String = ""
    var language : String = ""
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
