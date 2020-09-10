//
//  SalaryCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol SalaryCellViewModelOutput {
    var salary: Observable<Salary> { get }
}
protocol SalaryCellViewModelInput {
    
}
protocol SalaryCellViewModelType {
    var input: SalaryCellViewModelInput { get }
    var output: SalaryCellViewModelOutput { get }
}
class SalaryCellViewModel: SalaryCellViewModelType, SalaryCellViewModelInput, SalaryCellViewModelOutput {
    
    // MARK: Input & Ouput
    var input: SalaryCellViewModelInput { return self }
    var output: SalaryCellViewModelOutput { return self }
    
    // MARK: Outputs
    var salary: Observable<Salary>
    
    init(salary: Salary) {
        self.salary = Observable.just(salary)
    }
}
