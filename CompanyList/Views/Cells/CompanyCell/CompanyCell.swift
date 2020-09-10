//
//  CompanyCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift
import Kingfisher

class CompanyCell: UITableViewCell, BindableType {
    @IBOutlet weak var titleView: CompanyTitleView!
    @IBOutlet weak var reviewTextLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var interviewLabel: UILabel!
    
    
    // MARK: Viewmodel
    var viewModel: CompanyCellViewModelType!
    
    // MARK: private
    private var bag = DisposeBag()

    func bindViewModel() {
        let output = viewModel.output
        output.company
            .map { $0.companyTitle }
            .bind { [weak self] in
                self?.titleView.bind(to: CompanyTitleViewModel(common: $0))
            }.disposed(by: bag)
        
        output.company.map { $0.reviewSummry }
            .bind(to: reviewTextLabel.rx.text)
            .disposed(by: bag)
        
        output.company.map { "\(String($0.salrayAvg))만원" }
            .bind(to: salaryLabel.rx.text)
            .disposed(by: bag)
        
        output.company.map { $0.interviewQuestion }
            .bind(to: interviewLabel.rx.text)
            .disposed(by: bag)
    }
}
