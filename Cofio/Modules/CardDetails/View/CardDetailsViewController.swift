//
//  CardDetailsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

import UIKit

final class CardDetailsViewController: UIViewController {
    
    // MARK: Private properties
    
   // private let dataSource: CardsTableViewDataSourceProtocol
    
//    private lazy var cardsTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(CardsCell.self)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.separatorStyle = .none
//        tableView.delegate = self
//        return tableView
//    }()
    
//    private lazy var doneButton: DoneButton = {
//        let doneButton = DoneButton(title: "Добавить карточку")
//        doneButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
//        return doneButton
//    }()
    
//    private lazy var fadeView: FadeView = {
//        let fadeView = FadeView()
//        fadeView.translatesAutoresizingMaskIntoConstraints = false
//        return fadeView
//    }()
    private let output: CardDetailsViewOutput
    
    private lazy var closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
  //  private lazy var tableViewDataSource = dataSource.makeDataSource(for: cardsTableView)
    
    
    // MARK: Lifecycle
    
    init(output: CardDetailsViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    // MARK: Actions
    
    @objc func close() {
        output.close()
    }
}
