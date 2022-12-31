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
    
    private lazy var collectionsTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(MainModuleCell.self)
        tableview.register(MainModuleTitleCell.self)
        tableview.register(MainModuleSubtitleCell.self)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        tableview.delegate = self
        return tableview
    }()
    
    private lazy var bottomButton: UIButton = {
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
    
    init(output: MainViewOutput,
         dataSource: MainTableViewDataSourceProtocol) {
        self.output = output
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        output.refreshView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        output.viewDidLoad()
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
    
    // MARK: Actions
    
    @objc func addNewCollection() {
        output.addNewCollection()
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
}
