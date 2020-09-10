//
//  CellViewModelType.swift
//  CompanyList
//
//

import Foundation

enum CellViewModelType {
    case CompanyCell(CompanyCellViewModel)
    case InterviewCell(InterviewCellViewModel)
    case ReviewCell(ReviewCellViewModel)
    case DummyCell(DummyCellViewModel)
}
