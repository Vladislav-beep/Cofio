//
//  ViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 19.07.2022.
//

import UIKit

class StartAppViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: StartAppViewOutput
    private let coordinater: FlowCoordinator
    private let dataSource: TableViewDataSourceProtocol
    
    private lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: AppText.startAppScreen.title.rawValue)
        return titleLabel
    }()
    
    private lazy var subtitleLabel: SubtitleLabel = {
        let subtitle = SubtitleLabel(subtitle: AppText.startAppScreen.subtitle.rawValue)
        return subtitle
    }()
    
    private lazy var languagesTableView: UITableView = {
        let cool = UITableView()
        cool.register(LanguageCell.self)
        cool.translatesAutoresizingMaskIntoConstraints = false
        cool.separatorStyle = .none
        cool.delegate = self
        return cool
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppText.startAppScreen.buttonTitle.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        button.setTitleColor(UIColor.darkViolet, for: .normal)
        button.setTitleColor(UIColor.darkOrange, for: .highlighted)
        button.addTarget(self, action: #selector(addLanguage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: languagesTableView)
    
    
    // MARK: Lifecycle
    
    init(output: StartAppViewOutput,
         coordinater: FlowCoordinator,
         dataSource: TableViewDataSourceProtocol) {
        self.coordinater = coordinater
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
        updateView()
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
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(bottomButton)
        NSLayoutConstraint.activate([
            bottomButton.heightAnchor.constraint(equalToConstant: 56),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        
        view.addSubview(languagesTableView)
        NSLayoutConstraint.activate([
            languagesTableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            languagesTableView.bottomAnchor.constraint(equalTo: bottomButton.topAnchor, constant: -8),
            languagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            languagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    
    // MARK: Actions
    
    @objc func addLanguage() {
        output.addNewLanguage()
    }
}


// MARK: - StartAppViewInput

extension StartAppViewController: StartAppViewInput {
    
    func updateView() {
        let data = DymmyData.getDymmyData()
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Language>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot)
    }
}


// MARK: - UITableViewDelegate

extension StartAppViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        output.viewDidTapRow(item)
    }
}
