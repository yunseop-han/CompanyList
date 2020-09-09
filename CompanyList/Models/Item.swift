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
        switch item.cell_type {
        case "CELL_TYPE_COMPANY":
            let company = try! container.decode(Company.self)
            self = .CompanyItem(company)
        default:
            self = .Item(item)
        }
    }
    
    case CompanyItem(Company)
    case Item(Dummy)
}
