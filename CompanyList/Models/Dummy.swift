//
//  Dummy.swift
//  CompanyList
//
//

import Foundation

struct Dummy: CommonItemType, Decodable {
    var cellType: String
    
    enum CodingKeys: String, CodingKey {
        case cellType = "cell_type"
    }
}
