//
//  Company.swift
//  CompanyList
//
//

import Foundation

#warning("TODO: All Models Naming Convention")
struct Company: CommonItemType, Decodable {
    var cell_type: String
    var ranking: Int
    var review_summary: String
    var name: String
    var salary_avg: Int
    var logo_path: String
    var interview_question: String
    var industry_name: String
}
