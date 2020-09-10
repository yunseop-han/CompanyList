//
//  JobPosting.swift
//  CompanyList
//
//

import Foundation

struct JobPosting: CommonItemType, Decodable {
    var cellType: String
    var logo: String
    var companyName: String
    var title: String
    var reviewAvg: Double
    var deadline: Deadline
    
    
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
        case logo, title, deadline
        case companyName = "company_name"
        case reviewAvg = "review_avg_cache"
    }
    struct Deadline: Decodable {
        var message: String
        var hex_color: String
    }
}
