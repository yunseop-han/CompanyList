//
//  CompanyListViewController.swift
//  CompanyList
//
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


class CompanyListViewController: UIViewController {

    // MARK: - Properties
    // MARK: SectionModel
    typealias TableViewSectionModel = SectionModel<String, CellViewModelType>
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View model
    var viewModel = CompanyListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
    }
    
    // MARK: Private
    private var dataSoucre: RxTableViewSectionedReloadDataSource<TableViewSectionModel>!
    private let bag = DisposeBag()
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellReuseIdentifier: "companyCell")
        dataSoucre = RxTableViewSectionedReloadDataSource<TableViewSectionModel>.init(configureCell: tableViewDataSource)
    }
    
    private var tableViewDataSource: RxTableViewSectionedReloadDataSource<TableViewSectionModel>.ConfigureCell{
        return { (source, tableView, indexPath, viewModel) -> UITableViewCell in
            switch viewModel {
            case .CompanyCell(let viewModel):
                var cell = tableView.dequeueReusableCell(withIdentifier: "companyCell") as! CompanyCell
                cell.bind(to: viewModel)
                return cell
            default:
                let cell = UITableViewCell()
                return cell
            }
        }
    }
    
    func bindViewModel() {
        let output = viewModel.output
        
        output.tableCellModelType
            .map { [TableViewSectionModel(model: "", items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSoucre))
            .disposed(by: bag)
    }
}

