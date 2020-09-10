//
//  CompanyTitleView.swift
//  CompanyList
//
//

import UIKit
import RxSwift


protocol CompanyTitleViewModelInput { }
protocol CompanyTitleViewModelOutput {
    var CompanyTitle: Observable<CompanyTitle> { get }
}
protocol CompanyTitleViewModelType {
    var input: CompanyTitleViewModelInput { get }
    var output: CompanyTitleViewModelOutput { get }
    
}
class CompanyTitleViewModel: CompanyTitleViewModelType, CompanyTitleViewModelInput, CompanyTitleViewModelOutput {
    
    // MARK: Input & Output
    var input: CompanyTitleViewModelInput { return self }
    var output: CompanyTitleViewModelOutput { return self }
    
    // MARK: Outputs
    var CompanyTitle: Observable<CompanyTitle>
    init(common: CompanyTitle) {
        CompanyTitle = Observable.just(common)
    }
}

class CompanyTitleView: UIView, BindableType {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    
    // MARK: View model
    var viewModel: CompanyTitleViewModelType!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("CompanyTitleView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: Private
    private let bag = DisposeBag()
    func bindViewModel() {
        let output = viewModel.output
        output.CompanyTitle
            .map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: bag)
        
        output.CompanyTitle
            .map { String($0.rateTotalAvg) }
            .bind(to: ratingLabel.rx.text)
            .disposed(by: bag)
        
        output.CompanyTitle
            .map { $0.industryName }
            .bind(to: industryLabel.rx.text)
            .disposed(by: bag)
        
        output.CompanyTitle
            .map { URL(string: $0.logoPath) }
            .bind { [weak self] url in
                self?.logoImageView.kf.setImage(with: url, placeholder: UIImage(named: "default_logo"))
        }.disposed(by: bag)
        
    }
}
