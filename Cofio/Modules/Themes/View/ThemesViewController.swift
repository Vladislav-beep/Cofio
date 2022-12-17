//
//  ThemesViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class ThemesViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: ThemesViewOutput
    private let dataSource: ThemesTableViewDataSourceProtocol
    
    private lazy var collectionCardsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StatisticsCell.self)
        tableView.register(ThemesCell.self)
        tableView.register(HeaderCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: collectionCardsTableView)
    
    
    // MARK: Lifecycle
    
    init(output: ThemesViewOutput,
         dataSource: ThemesTableViewDataSourceProtocol) {
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTheme))
    }
    
    
    // MARK: Actions
    
    @objc func addTheme() {
        let alert = UIAlertController(
            title:"theme_module_alert_title"~,
            message: "theme_module_alert_subtitle"~,
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = "theme_module_alert_textField_placeholder"~
        }
        let addAction = UIAlertAction(
            title: "theme_module_alert_add_button"~,
            style: .default
        ) { _ in
            let tf = alert.textFields?.first
            let name = tf?.text ?? ""
            self.output.addTheme(name: name)
        }
        let cancelAction = UIAlertAction(
            title: "theme_module_alert_cancel_button"~,
            style: .default
        )
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}


// MARK: - CollectionsViewInput

extension ThemesViewController: ThemesViewInput {
    
    func updateData(with data: [ThemesCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, ThemesCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func setupNavBarTitle(with title: String) {
        navigationItem.title = title
    }
}


// MARK: - UITableViewDelegate

extension ThemesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let snapshot = tableViewDataSource.snapshot()
        let item = snapshot.itemIdentifiers[indexPath.row]
        
        switch item {
        case .statics(_):
            return 140
            
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
