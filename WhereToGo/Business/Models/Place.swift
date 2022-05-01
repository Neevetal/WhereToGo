//
//  Place.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 10.01.2022.
//

import Foundation
import ObjectMapper

struct Places: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Place]?
}

struct Place: Decodable {
    var id: Int?
    var title: String?
    var slug: String?
    var address: String?
    var phone: String?
    var site_url: String?
    var subway: String?
    var is_closed: Bool?
    var location: String?
    var has_parking_lot: Bool?
}
