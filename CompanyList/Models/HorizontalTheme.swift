//
//  HorizontalTheme.swift
//  CompanyList
//
//

import Foundation

struct HorizontalTheme:CommonItemType, Decodable {
    var cellType: String
    var count: Int
    var themes: [Theme]
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
        case count, themes
    }
}

struct Theme: Decodable {
    var color: String
    var cover_image: String
    var title: String
}
