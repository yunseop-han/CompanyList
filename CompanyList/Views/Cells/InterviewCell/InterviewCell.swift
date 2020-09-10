//
//  InterviewCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift

class InterviewCell: UITableViewCell, BindableType {
    @IBOutlet weak var titleView: CompanyTitleView!
    @IBOutlet weak var interviewQuestionLabel: UILabel!
    var viewModel: InterviewCellViewModelType!
    
    // MARK: Private
    private let bag = DisposeBag()
    
    func bindViewModel() {
        let output = viewModel.output
        
        output.interview
            .map { $0.interviewQuestion }
            .bind(to: interviewQuestionLabel.rx.text)
            .disposed(by: bag)
        output.interview
            .map { $0.companyTitle }
            .bind {
                [weak self] in
                self?.titleView.bind(to: CompanyTitleViewModel(common: $0))
        }.disposed(by: bag)
    }
    
}
