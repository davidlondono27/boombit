//
//  JokesModel.swift
//  boombit (iOS)
//
//  Created by David Londoño on 7/09/22.
//

import Foundation

struct MainResponse: Decodable {
    var categories : [String]
    var image : String
    var text : String
    
    enum CodingKeys: String, CodingKey {
        case categories
        case image = "icon_url"
        case text = "value"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categories = try container.decode([String].self, forKey: .categories)
        self.image = try container.decode(String.self, forKey: .image)
        self.text = try container.decode(String.self, forKey: .text)
    }
}



//{
//    "categories": [],
//    "created_at": "2020-01-05 13:42:21.795084",
//    "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
//    "id": "XYV8PgfSSyWVK50sYU0niw",
//    "updated_at": "2020-01-05 13:42:21.795084",
//    "url": "https://api.chucknorris.io/jokes/XYV8PgfSSyWVK50sYU0niw",
//    "value": "Chuck Norris's skateboard has 22\" spinning rims."
//}
