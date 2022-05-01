//
//  Event.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 10.01.2022.
//

import Foundation

struct Events: Decodable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Event]?
}

struct Event: Decodable {

    var title: String? = ""
    var description: String? = ""
    var bodyText: String? = ""
    var place: Place? = Place()
    var price: String? = ""
    var dates: [DateElement]? = []
    var images: [Image] = []

//    enum CodingKeys: String, CodingKey {
//        case dates, title
//        case resultDescription = "description"
//        case bodyText = "body_text"
//        case price, images
//    }
}

struct DateElement: Decodable {
    let start, end: Int?
}

struct Image: Decodable {
    var image: String? = ""
    var source: Source? =  Source()
}

struct Source: Decodable {
    var name: String? = ""
    var link: String? = ""
}

extension Event {

    var photoUrl: URL? {
        if !images.isEmpty {
            return URL.init(string: self.images[0].image ?? "")

        }
        return URL.init(string: "")
    }
}
