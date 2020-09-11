//
//  CoverCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift

class CoverCell: UICollectionViewCell, BindableType {
    

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: View model
    var viewModel: CoverCellViewModel!

    // MARK: Private
    private let bag = DisposeBag()
    
    func bindViewModel() {
        let output = viewModel.output
        
        output.theme
            .map { $0.title }
            .bind(to: titleLabel.rx.text)
            .disposed(by: bag)
        
        output.theme
            .map { URL(string: $0.cover_image) }
            .bind { [weak self] in
                self?.coverImageView.kf.setImage(with: $0, placeholder: UIImage(named: "default_logo"))
        }.disposed(by: bag)
    }
}
