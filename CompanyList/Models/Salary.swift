//
//  Salary.swift
//  CompanyList
//
//

import Foundation

struct Salary: CommonItemType, Decodable {
    var cellType: String
    var salaryAvg: Int
    var salaryLowest: Int
    var salaryHighest: Int
    var companyTitle: CompanyTitle
    
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
        case salaryAvg = "salary_avg"
        case salaryLowest = "salary_lowest"
        case salaryHighest = "salary_highest"
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        cellType = try! container.decode(String.self, forKey: .cellType)
        salaryAvg = try! container.decode(Int.self, forKey: .salaryAvg)
        salaryLowest = try! container.decode(Int.self, forKey: .salaryLowest)
        salaryHighest = try! container.decode(Int.self, forKey: .salaryHighest)
        companyTitle = try! CompanyTitle(from: decoder)
    }
}
