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
    
    private let themesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StatisticsCell.self)
        tableView.register(ThemesCell.self)
        tableView.register(HeaderCell.self)
        tableView.register(EmptyCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: themesTableView)
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.refreshView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
        
        output.viewDidLoad()
        themesTableView.delegate = self
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.addSubview(themesTableView)
        NSLayoutConstraint.activate([
            themesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            themesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            themesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            themesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTheme)
        )
    }
    
    // MARK: Actions
    
    @objc func addTheme() {
        output.addTheme()
    }
    
    // MARK: Private
    
    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(
            style: .destructive,
            title: "delete_button_title"~
        ) { [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .card(let model):
                self.output.deleteTheme(themeName: model.title)
                self.output.refreshView()
                
            case .statics, .header, .empty:
                break
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "trash")
        return action
    }
    
    private func editAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(
            style: .normal,
            title: "new_collection_module_button_edit_title"~
        ) { [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .card(let model):
                self.output.editTheme(currentName: model.title)
                
            case .statics, .header, .empty:
                break
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "slider.horizontal.3")
        return action
    }
    
    private func learnAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(
            style: .normal,
            title: "theme_module_start_learning_title"~
        ) { [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .card(let model):
                // TODO: add notification from top that theme is being repeated
                self.output.startLearningTheme(themeName: model.title)
                self.output.refreshView()
                
                
            case .statics, .header, .empty:
                break
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
        action.backgroundColor = .darkGreen
        return action
    }
}

// MARK: - ThemesViewInput

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
        case .statics:
            return 140
            
        case .header:
            return 50
            
        case .card, .empty:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        switch item {
        case .statics, .header, .empty:
            break
            
        case .card(let cardsCellDataModel):
            output.viewDidTapRow(cardsCellDataModel)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return nil }
        switch item {
        case .statics, .header, .empty:
            return nil
            
        case .card:
            let edit = editAction(at: indexPath)
            let learn = learnAction(at: indexPath)
            return UISwipeActionsConfiguration(actions: [learn, edit])
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return nil }
        
        switch item {
        case .statics, .header, .empty:
            return nil
            
        case .card:
            let delete = deleteAction(at: indexPath)
            return UISwipeActionsConfiguration(actions: [delete])
        }
    }
}
