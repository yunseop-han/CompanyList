//
//  Company.swift
//  CompanyList
//
//

import Foundation

struct Company: CommonItemType, Decodable {
    var cellType: String
    var reviewSummry: String
    var salrayAvg: Int
    var interviewQuestion: String
    var companyTitle: CompanyTitle
    
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
        case reviewSummry = "review_summary"
        case salrayAvg = "salary_avg"
        case interviewQuestion = "interview_question"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        cellType = try! container.decode(String.self, forKey: .cellType)
        reviewSummry = try! container.decode(String.self, forKey: .reviewSummry)
        salrayAvg = try! container.decode(Int.self, forKey: .salrayAvg)
        interviewQuestion = try! container.decode(String.self, forKey: .interviewQuestion)
        companyTitle = try! CompanyTitle(from: decoder)
    }
}

struct CompanyTitle: Decodable {
    var logoPath: String
    var name: String
    var rateTotalAvg: Double
    var industryName: String
    
    enum CodingKeys: String, CodingKey {
        case logoPath = "logo_path"
        case name
        case rateTotalAvg = "rate_total_avg"
        case industryName = "industry_name"
    }
}
