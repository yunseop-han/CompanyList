//
//  JobPostingCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift

class JobPostingCell: UITableViewCell, BindableType {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var reviewAvgLabel: UILabel!
    
    
    var viewModel: JobPostingCellViewModelType!
    
    
    // MARK: Private
    private let bag = DisposeBag()
    
    func bindViewModel() {
        let output = viewModel.output
        
        output.jobPosting
            .map { $0.companyName }
            .bind(to: companyLabel.rx.text)
            .disposed(by: bag)
        
        output.jobPosting
            .map { $0.title }
            .bind(to: titleLabel.rx.text)
            .disposed(by: bag)
        
        output.jobPosting
            .map { String($0.reviewAvg) }
            .bind(to: reviewAvgLabel.rx.text)
            .disposed(by: bag)
        
        output.jobPosting
            .map { $0.deadline.message }
            .bind(to: messageLabel.rx.text)
            .disposed(by: bag)
        
        output.jobPosting
            .map { UIColor(hexString: $0.deadline.hex_color) }
            .bind { [weak self] in
                self?.messageLabel.textColor = $0
        }
            .disposed(by: bag)
        
        output.jobPosting
            .map { URL(string: $0.logo) }
            .bind { [weak self] in
                self?.logoImageView.kf.setImage(with: $0, placeholder: UIImage(named: "default_logo"))
        }
            .disposed(by: bag)
    }
}
