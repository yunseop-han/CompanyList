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
        tableView.register(UINib(nibName: "InterviewCell", bundle: nil), forCellReuseIdentifier: "interviewCell")
        tableView.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "reviewCell")
        tableView.register(UINib(nibName: "SalaryCell", bundle: nil), forCellReuseIdentifier: "salaryCell")
        tableView.register(UINib(nibName: "JobPostingCell", bundle: nil), forCellReuseIdentifier: "jobPostingCell")
        
        dataSoucre = RxTableViewSectionedReloadDataSource<TableViewSectionModel>.init(configureCell: tableViewDataSource)
    }
    
    private var tableViewDataSource: RxTableViewSectionedReloadDataSource<TableViewSectionModel>.ConfigureCell{
        return { (source, tableView, indexPath, viewModel) -> UITableViewCell in
            switch viewModel {
            case .CompanyCell(let viewModel):
                var cell = tableView.dequeueReusableCell(withIdentifier: "companyCell") as! CompanyCell
                cell.bind(to: viewModel)
                return cell
                
            case .InterviewCell(let viewModel):
                var cell = tableView.dequeueReusableCell(withIdentifier: "interviewCell") as! InterviewCell
                cell.bind(to: viewModel)
                return cell
                
            case .ReviewCell(let viewModel):
                var cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewCell
                cell.bind(to: viewModel)
                return cell
                
            case .SalaryCell(let viewModel):
                var cell = tableView.dequeueReusableCell(withIdentifier: "salaryCell") as! SalaryCell
                cell.bind(to: viewModel)
                return cell
                
            case .JobPostingCell(let viewModel):
                var cell = tableView.dequeueReusableCell(withIdentifier: "jobPostingCell") as! JobPostingCell
                cell.bind(to: viewModel)
                return cell
                
            case .DummyCell(_):
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

