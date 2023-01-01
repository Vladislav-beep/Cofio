//
//  CardsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class CardsViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: CardsViewOutput
    private let dataSource: CardsTableViewDataSourceProtocol
    
    private lazy var cardsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CardsCell.self)
        tableView.register(CardsEmptyCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: cardsTableView)
    
    
    // MARK: Lifecycle
    
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
        
        setupViews()
        setupNavigationBar()

        output.viewDidLoad()
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(cardsTableView)
        NSLayoutConstraint.activate([
            cardsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cardsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            cardsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "cards_module_title"~
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.darkViolet
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCard))
    }
    
    
    // MARK: Actions
    
    @objc func addCard() {
        output.addCard()
    }
    
    // MARK: Private
    
    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive,
                                        title: "delete_button_title"~) {
            [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .card(let model):
                self.output.deleteCard(cardName: model.definition)
                self.output.refreshView()
                
            case .empty:
                break
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "trash")
        return action
    }
    
    private func editAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal,
                                        title: "new_collection_module_button_edit_title"~) {
            [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .card(let model):
                self.output.editCard(card: model)
                
            case .empty:
                break
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "slider.horizontal.3")
        return action
    }
}


// MARK: - CardsViewInput

extension CardsViewController: CardsViewInput {

    func updateData(with data: [CardCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CardCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}


// MARK: - UITableViewDelegate

extension CardsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        output.viewDidTapRow(item)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        let edit = editAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
}
