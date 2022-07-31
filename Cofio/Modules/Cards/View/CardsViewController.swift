//
//  CardsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class CardsViewController: UIViewController {
    
    private let output: CardsViewOutput
    private let dataSource: CardsTableViewDataSourceProtocol
    
    private lazy var cardsTableView: UITableView = {
        let cool = UITableView()
        cool.register(StatisticsCell.self)
        cool.register(CollectionCell.self)
        cool.translatesAutoresizingMaskIntoConstraints = false
        cool.separatorStyle = .none
        cool.delegate = self
        return cool
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: cardsTableView)
    
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
        title = "Карточки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(cardsTableView)
        NSLayoutConstraint.activate([
            cardsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cardsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cardsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        output.viewDidLoad()
    }
    
    @objc func close() {
        
    }
}

extension CardsViewController: CardsViewInput {
    
    func updateData(with data: [Card]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Card>()
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
            return 220
            
        case .card(_):
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        switch item {
        case .statics:
            break
            
        case .card(let cardsCellDataModel):
            output.viewDidTapRow(cardsCellDataModel)
        }
    }
}
