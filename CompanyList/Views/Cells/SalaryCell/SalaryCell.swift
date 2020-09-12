//
//  SalaryCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift

class SalaryCell: UITableViewCell, BindableType {
    @IBOutlet weak var titlevIew: CompanyTitleView!
    @IBOutlet weak var salaryAvgLabel: UILabel!
    @IBOutlet weak var minSalaryLabel: UILabel!
    @IBOutlet weak var maxSalaryLabel: UILabel!
    
    var viewModel: SalaryCellViewModelType!
    
    // MARK: Private
    private let bag = DisposeBag()
    
    func bindViewModel() {
        let output = viewModel.output
        
        output.salary
            .map { $0.salaryAvg.formatString()! + "만원" }
            .bind(to: salaryAvgLabel.rx.text)
            .disposed(by: bag)
        
        output.salary
            .map { $0.salaryLowest.formatString()! }
            .bind(to: minSalaryLabel.rx.text)
            .disposed(by: bag)
        
        output.salary
            .map { $0.salaryHighest.formatString()! }
            .bind(to: maxSalaryLabel.rx.text)
            .disposed(by: bag)
        
        output.salary
            .map { $0.companyTitle }
            .bind { [weak self] in
                self?.titlevIew.bind(to: CompanyTitleViewModel(common: $0))
        }.disposed(by: bag)
        
    }
}
