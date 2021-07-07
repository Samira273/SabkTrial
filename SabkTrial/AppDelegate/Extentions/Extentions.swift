//
//  Extentions.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/22/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(
                data: self,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

enum Sections: Int, CaseIterable {
    case sliderSection = 0
    case firstNewsSection = 1
    //    case videoSection = 2
    //    case latestArticle = 3
    //    case secondNewsSection = 4
    //    case photosSlider = 5
    //    case thirdNewsSection = 6
    //    case articles = 7
    //    case forthNewsSection = 8
    //    case footer = 9

}
