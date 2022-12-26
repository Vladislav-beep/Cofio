//
//  CardDetailsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

import UIKit

final class CardDetailsViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: CardDetailsViewOutput
    private let dataSource: CardDetailsDataSourceProtocol
    
    private lazy var draggableView: UIView = {
        let draggableView = UIView()
        draggableView.backgroundColor = .gray
        draggableView.layer.cornerRadius = 3
        draggableView.translatesAutoresizingMaskIntoConstraints = false
        return draggableView
    }()
    
    private lazy var cardDetailsTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CardDetailsCell.self)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        tableview.delegate = self
        return tableview
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: cardDetailsTableView)

    
    // MARK: Lifecycle
    
    init(output: CardDetailsViewOutput,
         dataSource: CardDetailsDataSourceProtocol) {
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
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(draggableView)
        NSLayoutConstraint.activate([
            draggableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            draggableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            draggableView.heightAnchor.constraint(equalToConstant: 6),
            draggableView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(cardDetailsTableView)
        NSLayoutConstraint.activate([
            cardDetailsTableView.topAnchor.constraint(equalTo: draggableView.bottomAnchor, constant: 20),
            cardDetailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            cardDetailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            cardDetailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

// MARK: - CardDetailsViewInput

extension CardDetailsViewController: CardDetailsViewInput {
    
    func updateView(model: CardCellDataModel) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CardCellDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems([model], toSection: 0)
        tableViewDataSource.apply(snapshot)
    }
}

// MARK: - UITableViewDelegate

extension CardDetailsViewController: UITableViewDelegate {}
