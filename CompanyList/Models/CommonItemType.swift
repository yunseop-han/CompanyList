//
//  CommonItemType.swift
//  CompanyList
//
//

import Foundation

protocol CommonItemType: Decodable{
    var cellType: String { get }
}
