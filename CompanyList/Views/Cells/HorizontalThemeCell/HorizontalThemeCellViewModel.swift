//
//  HorizontalThemeCellViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol HorizontalThemeCellViewModelOutput {
    var coverCellViewModelType: Observable<[CoverCellViewModel]> { get }
}
protocol HorizontalThemeCellViewModelInput {
    
}
protocol HorizontalThemeCellViewModelType {
    var input: HorizontalThemeCellViewModelInput { get }
    var output: HorizontalThemeCellViewModelOutput { get }
}
class HorizontalThemeCellViewModel: HorizontalThemeCellViewModelType, HorizontalThemeCellViewModelInput, HorizontalThemeCellViewModelOutput {
    
    // MARK Input & Output
    var input: HorizontalThemeCellViewModelInput { return self }
    var output: HorizontalThemeCellViewModelOutput { return self }
    
    // MAKR: Outputs
    lazy var coverCellViewModelType: Observable<[CoverCellViewModel]> = {
        return self.themes.mapMany {
            return CoverCellViewModel(theme: $0)
        }
    }()
    
    // MARK: Private
    var themes: Observable<[Theme]>
    
    init(themes: [Theme]) {
        self.themes = Observable.just(themes)
    }
    
}
