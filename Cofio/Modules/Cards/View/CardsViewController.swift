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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var doneButton: DoneButton = {
        let doneButton = DoneButton(title: "Добавить карточку")
        doneButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        return doneButton
    }()
    
    private lazy var fadeView: FadeView = {
        let fadeView = FadeView()
        fadeView.translatesAutoresizingMaskIntoConstraints = false
        return fadeView
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
        
        cardsTableView.addSubview(fadeView)
        NSLayoutConstraint.activate([
            fadeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            fadeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            fadeView.heightAnchor.constraint(equalToConstant: 106),
            fadeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        
        fadeView.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.heightAnchor.constraint(equalToConstant: 56),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupNavigationBar() {
        title = "Карточки"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.darkViolet
    }
    
    
    // MARK: Actions
    
    @objc func addCard() {
        
    }
}


// MARK: - CardsViewInput

extension CardsViewController: CardsViewInput {

    func updateData(with data: [CardCellDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CardCellDataModel>()
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
}
