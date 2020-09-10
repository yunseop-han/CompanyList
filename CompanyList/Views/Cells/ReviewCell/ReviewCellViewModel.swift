//
//  ReviewCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol ReviewCellViewModelInput {
    
}
protocol ReviewCellViewModelOutput {
    var review: Observable<Review> { get }
}

protocol ReviewCellViewModelType {
    var input: ReviewCellViewModelInput { get }
    var output: ReviewCellViewModelOutput { get }
}

class ReviewCellViewModel: ReviewCellViewModelType, ReviewCellViewModelInput, ReviewCellViewModelOutput {
    
    // MARK: Input & Output
    var input: ReviewCellViewModelInput { return self }
    var output: ReviewCellViewModelOutput { return self }
    
    // MARK: Outputs
    var review: Observable<Review>
    
    init(review: Review) {
        self.review = Observable.just(review)
    }
    
    
}
