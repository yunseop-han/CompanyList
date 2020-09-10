//
//  Review.swift
//  CompanyList
//
//

import Foundation

struct Review: CommonItemType, Decodable {
    var cellType: String
    var reviewSummary: String
    var pros: String
    var cons: String
    var companyTitle: CompanyTitle
    
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
        case reviewSummary = "review_summary"
        case pros, cons
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        cellType = try! container.decode(String.self, forKey: .cellType)
        reviewSummary = try! container.decode(String.self, forKey: .reviewSummary)
        pros = try! container.decode(String.self, forKey: .pros)
        cons = try! container.decode(String.self, forKey: .cons)
        companyTitle = try! CompanyTitle(from: decoder)
    }
}
