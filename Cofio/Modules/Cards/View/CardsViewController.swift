//
//  CardsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class CardsViewController: UIViewController {
    
    private let output: CardsViewOutput
    private let dataSource: CardsTableViewDataSourceProtocol
    
    private lazy var cardsTableView: UITableView = {
        let cool = UITableView()
        cool.register(CardsCell.self)
        cool.translatesAutoresizingMaskIntoConstraints = false
        cool.separatorStyle = .none
        cool.delegate = self
        return cool
    }()
    
    private lazy var doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Добавить карточку", for: .normal)
        doneButton.backgroundColor = .darkViolet
        doneButton.layer.cornerRadius = 15
        doneButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        return doneButton
    }()
    
    private lazy var fadeView: FadeView = {
        let fadeView = FadeView()
        fadeView.translatesAutoresizingMaskIntoConstraints = false
        return fadeView
    }()
    
    private lazy var tableViewDataSource = dataSource.makeDataSource(for: cardsTableView)
    
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
    
    private func setupViews() {
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
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupNavigationBar() {
        title = "Карточки"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationController?.navigationBar.tintColor = UIColor.darkViolet
    }
    
    @objc func close() {
        
    }
    
    @objc func addCard() {
        print("vlad")
    }
}

extension CardsViewController: CardsViewInput {

    func updateData(with data: [CardCellDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CardCellDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        tableViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CardsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = tableViewDataSource.itemIdentifier(for: indexPath) else { return }
        
        output.viewDidTapRow(item)
    }
}
