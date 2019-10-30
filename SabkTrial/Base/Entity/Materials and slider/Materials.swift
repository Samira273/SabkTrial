/*
 Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

 */

import Foundation
struct Materials: Codable {
    let id: String?
    let title: String?
    let secondaryTitle: String?
    let description: String?
    let publishDate: String?
    let publishDateHijryDate: String?
    let updateDate: String?
    let updateDateHijryDate: String?
    let categoryName: String?
    let parentCategoryName: String?
    let coverPhoto: String?
    let coverPhotoCaption: String?
    let authorName: String?
    let url: String?
    let materialType: String?
    let authorImg: String?
    let authorCity: String?
    let multipleAuthors: Bool?
    let imagesCount: Int?
    let videosCount: Int?
    let noOfLikes: Int?
    let noOfShares: Int?
    let noOfViews: Int?
    let noOfComments: Int?
    let liked: Bool?
    let readLater: Bool?
    let materialUpdated: Bool?
    let isEdit: Bool?
    let hasRelatedMaterials: Bool?
    let authors: [String]?
    let images: [Images]?
    let videos: [Videos]?
    let attachements: [Attachments]?
    let tags: [Tags]?
    let updates: [String]?
    let relatedMaterials: [String]?
    let matarialDisplayed: String?
    let comments: [String]?
    let descriptionString: String?
    let city: String?
    let commentsEnabled: Bool?
    let commentsMinCharacters: Int?
    let commentsMaxCharacters: Int?
    var type = Materialtypes.news
    var timeApart: String?

    enum CodingKeys: String, CodingKey {

        case id
        case title
        case secondaryTitle
        case description
        case publishDate
        case publishDateHijryDate
        case updateDate
        case updateDateHijryDate
        case categoryName
        case parentCategoryName
        case coverPhoto
        case coverPhotoCaption
        case authorName
        case url
        case materialType
        case authorImg
        case authorCity
        case multipleAuthors
        case imagesCount
        case videosCount
        case noOfLikes
        case noOfShares
        case noOfViews
        case noOfComments
        case liked
        case readLater
        case materialUpdated
        case isEdit
        case hasRelatedMaterials
        case authors
        case images
        case videos
        case attachements
        case tags
        case updates
        case relatedMaterials
        case matarialDisplayed
        case comments
        case descriptionString
        case city
        case commentsEnabled
        case commentsMinCharacters
        case commentsMaxCharacters
    }
//    swiftlint:disable function_body_length
    init(type: Materialtypes) {
        self.type = type
        id = "id"
        title = "title"
        secondaryTitle = "secondaryTitle"
        description = "description"
        publishDate = "publishDate"
        publishDateHijryDate = "publishDateHijryDate"
        updateDate = "updateDate"
        updateDateHijryDate = "updateDateHijryDate"
        categoryName = "categoryName"
        parentCategoryName = "parentCategoryName"
        coverPhoto = "coverPhoto"
        coverPhotoCaption = "coverPhotoCaption"
        authorName = "authorName"
        url = "url"
        materialType = "materialType"
        authorImg = "authorImg"
        authorCity = "authorCity"
        multipleAuthors = false
        imagesCount = 0
        videosCount = 0
        noOfLikes = 0
        noOfShares = 0
        noOfViews = 0
        noOfComments = 0
        liked = false
        readLater = false
        materialUpdated = false
        isEdit = false
        hasRelatedMaterials = false
        authors = []
        images = []
        videos = []
        attachements = []
        tags = []
        updates = []
        relatedMaterials = []
        matarialDisplayed = "matarialDisplayed"
        comments = []
        descriptionString = "descriptionString"
        city = "city"
        commentsEnabled = false
        commentsMinCharacters = 0
        commentsMaxCharacters = 0
    }
//    swiftlint:disable function_body_length
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        secondaryTitle = try values.decodeIfPresent(String.self, forKey: .secondaryTitle)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        publishDate = try values.decodeIfPresent(String.self, forKey: .publishDate)
        publishDateHijryDate = try values.decodeIfPresent(String.self, forKey: .publishDateHijryDate)
        updateDate = try values.decodeIfPresent(String.self, forKey: .updateDate)
        updateDateHijryDate = try values.decodeIfPresent(String.self, forKey: .updateDateHijryDate)
        categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
        parentCategoryName = try values.decodeIfPresent(String.self, forKey: .parentCategoryName)
        coverPhoto = try values.decodeIfPresent(String.self, forKey: .coverPhoto)
        coverPhotoCaption = try values.decodeIfPresent(String.self, forKey: .coverPhotoCaption)
        authorName = try values.decodeIfPresent(String.self, forKey: .authorName)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        materialType = try values.decodeIfPresent(String.self, forKey: .materialType)
        authorImg = try values.decodeIfPresent(String.self, forKey: .authorImg)
        authorCity = try values.decodeIfPresent(String.self, forKey: .authorCity)
        multipleAuthors = try values.decodeIfPresent(Bool.self, forKey: .multipleAuthors)
        imagesCount = try values.decodeIfPresent(Int.self, forKey: .imagesCount)
        videosCount = try values.decodeIfPresent(Int.self, forKey: .videosCount)
        noOfLikes = try values.decodeIfPresent(Int.self, forKey: .noOfLikes)
        noOfShares = try values.decodeIfPresent(Int.self, forKey: .noOfShares)
        noOfViews = try values.decodeIfPresent(Int.self, forKey: .noOfViews)
        noOfComments = try values.decodeIfPresent(Int.self, forKey: .noOfComments)
        liked = try values.decodeIfPresent(Bool.self, forKey: .liked)
        readLater = try values.decodeIfPresent(Bool.self, forKey: .readLater)
        materialUpdated = try values.decodeIfPresent(Bool.self, forKey: .materialUpdated)
        isEdit = try values.decodeIfPresent(Bool.self, forKey: .isEdit)
        hasRelatedMaterials = try values.decodeIfPresent(Bool.self, forKey: .hasRelatedMaterials)
        authors = try values.decodeIfPresent([String].self, forKey: .authors)
        images = try values.decodeIfPresent([Images].self, forKey: .images)
        videos = try values.decodeIfPresent([Videos].self, forKey: .videos)
        attachements = try values.decodeIfPresent([Attachments].self, forKey: .attachements)
        tags = try values.decodeIfPresent([Tags].self, forKey: .tags)
        updates = try values.decodeIfPresent([String].self, forKey: .updates)
        relatedMaterials = try values.decodeIfPresent([String].self, forKey: .relatedMaterials)
        matarialDisplayed = try values.decodeIfPresent(String.self, forKey: .matarialDisplayed)
        comments = try values.decodeIfPresent([String].self, forKey: .comments)
        descriptionString = try values.decodeIfPresent(String.self, forKey: .descriptionString)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        commentsEnabled = try values.decodeIfPresent(Bool.self, forKey: .commentsEnabled)
        commentsMinCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMinCharacters)
        commentsMaxCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMaxCharacters)

    }

}

enum Materialtypes: String {
    case news
    case images
    case articles
    case videos 
}
