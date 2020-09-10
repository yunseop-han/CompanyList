//
//  ReviewCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift

class ReviewCell: UITableViewCell, BindableType {
    @IBOutlet weak var titleview: CompanyTitleView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var consLabel: UILabel!
    var viewModel: ReviewCellViewModelType!
    
    // MARK: Private
    private let bag = DisposeBag()
    
    func bindViewModel() {
        let output = viewModel.output
        output.review
            .map { $0.pros }
            .bind(to: prosLabel.rx.text)
            .disposed(by: bag)
        
        output.review
            .map { $0.cons }
            .bind(to: consLabel.rx.text)
            .disposed(by: bag)
        
        output.review
            .map { $0.reviewSummary }
            .bind(to: reviewLabel.rx.text)
            .disposed(by: bag)
        
        output.review
            .map { $0.companyTitle }
            .bind { [weak self] in self?.titleview.bind(to: CompanyTitleViewModel(common: $0))}
            .disposed(by: bag)
        
    }
}
