//
//  CompanyCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift


protocol CompanyCellViewModelInput { }
protocol CompanyCellViewModelOutput {
    var company: Observable<Company> { get }
}

protocol CompanyCellViewModelType {
    var input: CompanyCellViewModelInput { get }
    var output: CompanyCellViewModelOutput { get }
}
class CompanyCellViewModel: CompanyCellViewModelType, CompanyCellViewModelInput, CompanyCellViewModelOutput {
    
    // MARK: Input & Output
    var input: CompanyCellViewModelInput { return self }
    var output: CompanyCellViewModelOutput { return self }
    
    // MARK: Outputs
    var company: Observable<Company>
    
    init(company: Company) {
        self.company = Observable.just(company)
    }
}
