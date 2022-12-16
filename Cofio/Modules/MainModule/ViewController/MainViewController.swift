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
    
    private lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: "main_module_title"~)
        return titleLabel
    }()
    
    private lazy var subtitleLabel: SubtitleLabel = {
        let subtitle = SubtitleLabel(subtitle: "main_module_subtitle"~)
        return subtitle
    }()
    
    private lazy var languagesTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(MainModuleCell.self)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        tableview.delegate = self
        return tableview
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
      //  button.setTitle("+", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
       // button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
      //  button.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.darkOrange, for: .highlighted)
        button.addTarget(self, action: #selector(addNewCollection), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .violet
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: languagesTableView)
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        output.viewDidLoad()
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(languagesTableView)
        NSLayoutConstraint.activate([
            languagesTableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            languagesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            languagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            languagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
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
        output.addNewLanguage()
    }
}


// MARK: - StartAppViewInput

extension MainViewController: MainViewInput {
    
    func updateView(with data: [MainModuleCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, MainModuleCellViewModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot)
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
