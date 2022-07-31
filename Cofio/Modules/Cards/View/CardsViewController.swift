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
        cool.register(CardsCell.self)
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationController?.navigationBar.tintColor = UIColor.darkViolet
    }
    
    @objc func close() {
        
    }
}

extension CardsViewController: CardsViewInput {

    func updateData(with data: [CardCellDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CardCellDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CardsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        output.viewDidTapRow(item)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        200
//    }
}
