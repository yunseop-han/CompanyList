//
//  HorizontalThemeCell.swift
//  CompanyList
//
//

import UIKit
import RxSwift
import RxDataSources

class HorizontalThemeCell: UITableViewCell, BindableType {
    typealias CoverCellSectionModel = SectionModel<String, CoverCellViewModel>

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: View model
    var viewModel: HorizontalThemeCellViewModelType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    // MARK: Private
    private let bag = DisposeBag()
    private var dataSoucre: RxCollectionViewSectionedReloadDataSource<CoverCellSectionModel>!
    
    func bindViewModel() {
        let output = viewModel.output
        self.collectionView.delegate = nil
        self.collectionView.dataSource = nil

        output.coverCellViewModelType
            .map { [CoverCellSectionModel(model: "", items: $0)]}
            .bind(to: collectionView.rx.items(dataSource: dataSoucre))
            .disposed(by: bag)
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: "CoverCell", bundle: nil), forCellWithReuseIdentifier: "coverCell")
        dataSoucre = RxCollectionViewSectionedReloadDataSource<CoverCellSectionModel>(configureCell: collectionViewDataSource)
    }
    
    private var collectionViewDataSource: RxCollectionViewSectionedReloadDataSource<CoverCellSectionModel>.ConfigureCell {
        return { (_, collectionView, indexPath, cellModel) -> UICollectionViewCell in
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coverCell", for: indexPath) as! CoverCell
            cell.bind(to: cellModel)
            return cell
        }
    }
    
}
