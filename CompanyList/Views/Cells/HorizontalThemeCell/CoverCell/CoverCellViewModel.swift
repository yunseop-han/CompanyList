//
//  CoverCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol CoverCellViewModelInput { }
protocol CoverCellViewModelOutput {
    var theme: Observable<Theme> { get }
}
protocol CoverCellViewModelType {
    var input: CoverCellViewModelInput { get }
    var output: CoverCellViewModelOutput { get }
}

class CoverCellViewModel: CoverCellViewModelType, CoverCellViewModelInput, CoverCellViewModelOutput {
    
    // MARK: Input & Output
    var input: CoverCellViewModelInput { return self }
    var output: CoverCellViewModelOutput { return self }
    
    var theme: Observable<Theme>
    
    init(theme: Theme) {
        self.theme = Observable.just(theme)
    }
    
}
