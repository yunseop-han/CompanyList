//
//  CompanyListViewModel.swift
//  CompanyList
//
//

import Foundation
import RxSwift

protocol CompanyListViewModelOutput {
    var tableCellModelType: Observable<[CellViewModelType]> { get }
}
protocol CompanyListViewModelInput { }
protocol CompanyListViewModelType {
    var input: CompanyListViewModelInput { get }
    var output: CompanyListViewModelOutput { get }
}

class CompanyListViewModel: CompanyListViewModelType, CompanyListViewModelInput, CompanyListViewModelOutput {
    
    // MARK: Input & Output
    var input: CompanyListViewModelInput { return self }
    var output: CompanyListViewModelOutput { return self }
    
    // MARK: Outputs
    lazy var tableCellModelType: Observable<[CellViewModelType]> = {
        return self.items.mapMany { item in
            switch item {
            case .CompanyItem(let company):
                let viewModel = CompanyCellViewModel(company: company)
                return .CompanyCell(viewModel)
                
            case .InterviewItem(let interview):
                let viewModel = InterviewCellViewModel(interview: interview)
                return .InterviewCell(viewModel)
            
            case .ReviewItem(let review):
                let viewModel = ReviewCellViewModel(review: review)
                return .ReviewCell(viewModel)
                    
            case .Item(let dummy):
                let viewModel = DummyCellViewModel()
                return .DummyCell(viewModel)
            }
        }
        
    }()
    
    // MARK: Init
    init() {
        items = fetch()
    }
    
    // MARK: Private
    private let bag = DisposeBag()
    private var items: Observable<[Item]>!
    
    private func fetch() -> Observable<[Item]> {
        return Observable<[Item]>.create { observer in
            let url = URL(string: "https://api-test-198703.appspot.com/")!
            let urlRequest = URLRequest(url: url)
            return URLSession.shared.rx.response(request: urlRequest)
                .filter { 200 ..< 300 ~= $0.0.statusCode }
                .map { _, data -> [Item] in
                    let items = try! JSONDecoder().decode(Response.self, from: data).items
                    return items
            }.bind(to: observer)
        }
    }
}
