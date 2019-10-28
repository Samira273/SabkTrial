//
//  Attachments.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/21/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
struct Attachments: Codable {
    let name: String?
    let url: String?
    let caption: String?
    let type: String?
    let downloadCount: Int?
    enum CodingKeys: String, CodingKey {
        case name
        case url
        case caption
        case type
        case downloadCount 
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        downloadCount = try values.decodeIfPresent(Int.self, forKey: .downloadCount)
    }
}
