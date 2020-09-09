//
//  Response.swift
//  CompanyList
//
//

import Foundation

#warning("TODO: All Models Naming Convention")
struct Response: Decodable {
    
    var minimum_interviews: Int
    var total_page: Int
    var minimum_reviews: Int
    var total_count: Int
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case minimum_interviews = "minimum_interviews"
        case total_page = "total_page"
        case minimum_reviews = "minimum_reviews"
        case total_count = "total_count"
        case items = "items"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([Item].self, forKey: .items)
        minimum_interviews = try container.decode(Int.self, forKey: .minimum_interviews)
        total_page = try container.decode(Int.self, forKey: .total_page)
        minimum_reviews = try container.decode(Int.self, forKey: .minimum_reviews)
        total_count = try container.decode(Int.self, forKey: .total_count)
    }
}
