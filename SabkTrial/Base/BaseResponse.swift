//
//  BaseResponse.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 11/4/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
class BaseResponse: Codable {
    let code: Int?
    //    let message: String?
    let error: String?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case error
    }
    
}
