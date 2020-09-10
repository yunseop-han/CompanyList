//
//  Response.swift
//  CompanyList
//
//

import Foundation

struct Response: Decodable {
    
    var minimumInterviews: Int
    var totalPage: Int
    var minimumReviews: Int
    var totalCount: Int
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case minimumInterviews = "minimum_interviews"
        case totalPage = "total_page"
        case minimumReviews = "minimum_reviews"
        case totalCount = "total_count"
        case items = "items"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([Item].self, forKey: .items)
        minimumInterviews = try container.decode(Int.self, forKey: .minimumInterviews)
        totalPage = try container.decode(Int.self, forKey: .totalPage)
        minimumReviews = try container.decode(Int.self, forKey: .minimumReviews)
        totalCount = try container.decode(Int.self, forKey: .totalCount)
    }
}
