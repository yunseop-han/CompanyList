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
            
        case "CELL_TYPE_REVIEW":
            let review = try! container.decode(Review.self)
            self = .ReviewItem(review)
            
        case "CELL_TYPE_SALARY":
            let salary = try! container.decode(Salary.self)
            self = .SalaryItem(salary)
            
        default:
            self = .Item(item)
        }
    }
    
    case CompanyItem(Company)
    case InterviewItem(Interview)
    case ReviewItem(Review)
    case SalaryItem(Salary)
    case Item(Dummy)
}
