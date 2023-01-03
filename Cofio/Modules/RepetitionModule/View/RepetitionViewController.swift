//
//  RepetitionViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: RepetitionViewOutput
    private let dataSource: RepetitionTableViewDataSourceProtocol
 
    private lazy var repetitionTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepetitionCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: repetitionTableView)
    
    // MARK: Lifecycle
    
    init(output: RepetitionViewOutput,
         dataSource: RepetitionTableViewDataSourceProtocol) {
        self.output = output
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        output.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
        
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(repetitionTableView)
        NSLayoutConstraint.activate([
            repetitionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            repetitionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            repetitionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            repetitionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "repetition_module_title"~
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // FIXME: Разобраться почему меняется цвет таббара
        navigationController?.tabBarController?.tabBar.backgroundColor = .base
    }
}


// MARK: - RepetitionViewInput

extension RepetitionViewController: RepetitionViewInput {
    
    func updateData(with data: [RepetitionCellDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, RepetitionCellDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}


// MARK: - UITableViewDelegate

extension RepetitionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        output.viewDidTapRow(item)
    }
}
