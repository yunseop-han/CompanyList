//
//  JobPostingCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol JobPostingCellViewModelInput {
    
}
protocol JobPostingCellViewModelOutput {
    var jobPosting: Observable<JobPosting> { get }
}
protocol JobPostingCellViewModelType {
    var input: JobPostingCellViewModelInput { get }
    var output: JobPostingCellViewModelOutput { get }
}

class JobPostingCellViewModel: JobPostingCellViewModelType, JobPostingCellViewModelInput, JobPostingCellViewModelOutput {
    
    // MARK: Input & Output
    var input: JobPostingCellViewModelInput { return self }
    var output: JobPostingCellViewModelOutput { return self }
    
    // MARK: Outputs
    var jobPosting: Observable<JobPosting>
    
    init(jobPosting: JobPosting) {
        self.jobPosting = Observable.just(jobPosting)
    }
}
