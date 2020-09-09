//
//  CompanyCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift
import Kingfisher

class CompanyCell: UITableViewCell, BindableType {
    @IBOutlet weak var logoImageVIew: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    #warning("TODO: rating label")
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
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
            .map { URL(string: $0.logo_path)! }
            .bind { [weak self] url in
                self?.logoImageVIew.kf.setImage(with: url)
        }.disposed(by: bag)
        
        output.company.map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: bag)
        
        output.company.map { $0.industry_name }
            .bind(to: industryLabel.rx.text)
            .disposed(by: bag)
        
        output.company.map { $0.review_summary }
            .bind(to: reviewTextLabel.rx.text)
            .disposed(by: bag)
        
        output.company.map { "\(String($0.salary_avg))만원" }
            .bind(to: salaryLabel.rx.text)
            .disposed(by: bag)
        
        output.company.map { $0.interview_question }
            .bind(to: interviewLabel.rx.text)
            .disposed(by: bag)
    }
}
