//
//  CollectionsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class CollectionsViewController: UIViewController {
    
    private let output: CollectionsViewOutput
    private let dataSource: CollectionsTableViewDataSourceProtocol
    
    private lazy var collectionCardsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StatisticsCell.self)
        tableView.register(CollectionCell.self)
        tableView.register(HeaderCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: collectionCardsTableView)
    
    init(output: CollectionsViewOutput,
         dataSource: CollectionsTableViewDataSourceProtocol) {
        self.output = output
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
        
        output.viewDidLoad()
    }
    
    private func setupViews() {
        view.addSubview(collectionCardsTableView)
        NSLayoutConstraint.activate([
            collectionCardsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionCardsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionCardsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionCardsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Сменить язык", style: .plain, target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem?.tintColor = .darkViolet
        navigationItem.leftBarButtonItem?.tintColor = .darkViolet
    }
    
    @objc func close() {
        output.viewDidTapClose()
    }
}

extension CollectionsViewController: CollectionsViewInput {
    
    func updateData(with data: [CollectionsCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CollectionsCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func setupNavBarTitle(with title: String) {
        navigationItem.title = title
    }
}

extension CollectionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let snapshot = tableViewDataSource.snapshot()
        let item = snapshot.itemIdentifiers[indexPath.row]
        
        switch item {
        case .statics(_):
            return 220
            
        case .header(_):
            return 50

        case .card(_):
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        switch item {
        case .statics, .header:
            break
            
        case .card(let cardsCellDataModel):
            output.viewDidTapRow(cardsCellDataModel)
        }
    }
}

