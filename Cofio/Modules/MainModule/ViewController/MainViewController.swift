//
//  MainViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 19.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: MainViewOutput
    private let dataSource: MainTableViewDataSourceProtocol
    
    private let collectionsTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(MainModuleCell.self)
        tableview.register(MainModuleTitleCell.self)
        tableview.register(MainModuleSubtitleCell.self)
        tableview.register(EmptyCell.self)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        return tableview
    }()
    
    private let bottomButton: UIButton = {
        // TODO: Добавить анимацию
        let button = UIButton()
        button.setImage(UIImage(named: "pluss")?.withTintColor(.white), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.darkOrange, for: .highlighted)
        button.addTarget(self, action: #selector(addNewCollection), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .violet
        button.layer.shadowRadius = 6
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: collectionsTableView)
    
    // MARK: Lifecycle
    
    init(
        output: MainViewOutput,
        dataSource: MainTableViewDataSourceProtocol
    ) {
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
        
        output.viewDidLoad()
        setupViews()
        setupNavigationBar()
        collectionsTableView.delegate = self
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(collectionsTableView)
        NSLayoutConstraint.activate([
            collectionsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        view.addSubview(bottomButton)
        NSLayoutConstraint.activate([
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.widthAnchor.constraint(equalToConstant: 50),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    private func setupNavigationBar() {
        title = Strings.MainModule.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(
            style: .destructive,
            title: Strings.Common.DeleteButton.title
        ) { [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .subtitle, .empty:
                break
                
            case .collection(let model):
                self.output.deleteCollection(collectionName: model.title)
                self.output.refreshView()
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "trash")
        return action
    }
    
    private func editAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(
            style: .normal,
            title: Strings.NewCollectionModule.Button.editTitle
        ) { [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .subtitle, .empty:
                break
                
            case .collection(let model):
                self.output.editCollection(collectionName: model.title)
                self.output.refreshView()
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "slider.horizontal.3")
        return action
    }
    
    private func learnAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(
            style: .normal,
            title: Strings.MainModule.StartLearning.title
        ) { [weak self] (action, view, complition) in
            guard let self = self else { return }
            
            guard let item = self.tableViewDataSource.itemIdentifier(for: indexPath) else { return }
            switch item {
            case .subtitle, .empty:
                break
                
            case .collection(let model):
                self.output.startLearnCollection(collectionName: model.title, creationDate: model.creationDate)
            }
            
            complition(true)
        }
        action.image = UIImage(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
        action.backgroundColor = .darkGreen
        return action
    }
    
    // MARK: Actions
    
    @objc func addNewCollection() {
        output.viewDidTapButton()
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
    
    func updateView(with data: [MainModuleCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, MainModuleCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        output.viewDidTapRow(item)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let learn = learnAction(at: indexPath)
        let edit = editAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [learn, edit])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
