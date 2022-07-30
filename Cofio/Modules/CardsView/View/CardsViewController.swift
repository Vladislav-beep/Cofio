//
//  CardsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class CardsViewController: UIViewController {
    
    private let output: CardsViewOutput
    private let dataSource: CardsTableViewDataSourceProtocol
    
    private lazy var collectionCardsTableView: UITableView = {
        let cool = UITableView()
        cool.register(StatisticsCell.self)
        cool.register(CardsCollectionCell.self)
        cool.translatesAutoresizingMaskIntoConstraints = false
        cool.separatorStyle = .none
        cool.delegate = self
        return cool
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: collectionCardsTableView)
    
    init(output: CardsViewOutput,
         dataSource: CardsTableViewDataSourceProtocol) {
        self.output = output
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Сборники"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(collectionCardsTableView)
        NSLayoutConstraint.activate([
            collectionCardsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionCardsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionCardsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionCardsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        output.viewDidLoad()
    }
}

extension CardsViewController: CardsViewInput {
    
    func updateData(with data: [CardsCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CardsCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CardsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let snapshot = tableViewDataSource.snapshot()
        let item = snapshot.itemIdentifiers[indexPath.row]
        
        switch item {
        case .statics(_):
            return 350
            
        case .card(_):
            return UITableView.automaticDimension
        }
    }
}

