//
//  LearningMethodViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 11.01.2023.
//

import UIKit

class LearningMethodViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: LearningMethodViewOutput
    private let dataSource: LearningTableViewDataSourceProtocol
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.text = "learning_method_module_title"~
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let learnigTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(LearningCell.self)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        return tableview
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: learnigTableView)
    
    // MARK: Lifecycle
    
    init(
        output: LearningMethodViewOutput,
        dataSource: LearningTableViewDataSourceProtocol
    ) {
        self.output = output
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupViews()
        learnigTableView.delegate = self
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(learnigTableView)
        NSLayoutConstraint.activate([
            learnigTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            learnigTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            learnigTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            learnigTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

// MARK: - LearningMethodViewInput

extension LearningMethodViewController: LearningMethodViewInput {

    func updateData(with data: [LearningCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, LearningCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: false)
    }
}


// MARK: - UITableViewDelegate

extension LearningMethodViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        switch item {
        case .long:
            output.viewDidTapLongCell()
            
        case .week:
            output.viewDidTapWeekCell()
        }
    }
}
