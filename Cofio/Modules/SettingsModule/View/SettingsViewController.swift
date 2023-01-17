//
//  SettingsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 11.12.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: SettingsViewOutput
    private let dataSource: SettingsTableViewDataSourceProtocol

    private let settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: settingsTableView)
    
    // MARK: Lifecycle
    
    init(
        output: SettingsViewOutput,
        dataSource: SettingsTableViewDataSourceProtocol
    ) {
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
        setupNavigationBar()
        settingsTableView.delegate = self
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(settingsTableView)
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "settings_module_title"~
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func deleteAllData() {
        let handler: () -> Void = { [weak self] in
            self?.output.deleteAllData()
        }
        showTwoButtonAlert(
            title: "Удалить все данные?",
            message: "Вы действительно хотите удалить все данные?",
            actionTitle: "Удалить",
            completion: handler
        )
    }
}

// MARK: - SettingsViewInput

extension SettingsViewController: SettingsViewInput {
    
    func updateData(with data: [SettingsCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, SettingsCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 75 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        switch item {
        case .learning:
            output.viewDidTapLearningCell()
            
        case .onboarding:
            output.viewDidTapOnboardingCell()
            
        case .deleteAllData:
            deleteAllData()
        }
    }
}
