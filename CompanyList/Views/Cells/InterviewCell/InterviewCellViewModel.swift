//
//  InterviewCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol InterviewCellViewModelInput {
    
}
protocol InterviewCellViewModelOutput {
    var interview: Observable<Interview> { get }
}

protocol InterviewCellViewModelType {
    var input: InterviewCellViewModelInput { get }
    var output: InterviewCellViewModelOutput { get }
    
}

class InterviewCellViewModel: InterviewCellViewModelType, InterviewCellViewModelInput, InterviewCellViewModelOutput  {
    
    // MARK: Input & Output
    var input: InterviewCellViewModelInput { return self }
    var output: InterviewCellViewModelOutput { return self }
    
    // MARK: Ouputs
    var interview: Observable<Interview>
    
    init(interview: Interview) {
        self.interview = Observable.just(interview)
    }
    
    
}
