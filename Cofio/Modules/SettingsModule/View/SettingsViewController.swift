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

    private let settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepetitionCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: Lifecycle
    
    init(output: SettingsViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        setupNavigationBar()
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(settingsTableView)
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "settings_module_title"~
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - SettingsViewInput

extension SettingsViewController: SettingsViewInput {}
