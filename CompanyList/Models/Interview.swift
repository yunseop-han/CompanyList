//
//  Interview.swift
//  CompanyList
//
//

import Foundation

struct Interview: CommonItemType, Decodable {
    var cellType: String
    var interviewQuestion: String
    var companyTitle: CompanyTitle
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
        case interviewQuestion = "interview_question"
        case companyTitle
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        cellType = try! container.decode(String.self, forKey: .cellType)
        interviewQuestion = try! container.decode(String.self, forKey: .interviewQuestion)
        companyTitle = try! CompanyTitle(from: decoder)
    }
    
}
