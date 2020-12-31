//
//  Package.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import Foundation

struct Package: Codable {
    let title: String
    let desc: String
    let thumbnailUrls: [String]
    let included: [String]
    let excluded: [String]?
    let payment: String
    let price: Int
    let action: String
    let headline: String?

    enum CodingKeys: String, CodingKey {
        case title, desc
        case thumbnailUrls = "thumbnail_urls"
        case included, excluded, payment, price, action, headline
    }
}
