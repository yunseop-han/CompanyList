//
//  Item.swift
//  CompanyList
//
//

import Foundation

enum Item: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let item = try container.decode(Dummy.self)
        switch item.cellType {
        case "CELL_TYPE_COMPANY":
            let company = try! container.decode(Company.self)
            self = .CompanyItem(company)
        
        case "CELL_TYPE_INTERVIEW":
            let interview = try! container.decode(Interview.self)
            self = .InterviewItem(interview)
            
        default:
            self = .Item(item)
        }
    }
    
    case CompanyItem(Company)
    case InterviewItem(Interview)
    case Item(Dummy)
}
