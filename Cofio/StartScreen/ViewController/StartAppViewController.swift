//
//  ViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 19.07.2022.
//

import UIKit

class StartAppViewController: UIViewController {
    
    private let output: StartAppViewOutput
    private let coordinater: FlowCoordinator
    
    private lazy var titleL: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        title.numberOfLines = 0
        title.text = "Иностранные языки"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var subtitleL: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        title.numberOfLines = 0
        title.text = "Изучение иностранных языков c кем и чеком и чебуреком с сыром и мясом лол ушцкрпм лдылмттлывм вымо"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var collectionView: UICollectionView = {
        let cool = UICollectionView.languageCollectionView
        cool.register(LanguageCell.self, forCellWithReuseIdentifier: "cell")
        cool.delegate = self
        cool.dataSource = self
        return cool
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить язык", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        button.setTitleColor(UIColor.darkViolet, for: .normal)
        button.setTitleColor(UIColor.darkOrange, for: .highlighted)
        button.addTarget(self, action: #selector(addLanguage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(output: StartAppViewOutput, coordinater: FlowCoordinator) {
        self.coordinater = coordinater
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleL)
        NSLayoutConstraint.activate([
            titleL.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleL.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(subtitleL)
        NSLayoutConstraint.activate([
            subtitleL.topAnchor.constraint(equalTo: titleL.bottomAnchor, constant: 16),
            subtitleL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subtitleL.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(bottomButton)
        NSLayoutConstraint.activate([
            bottomButton.heightAnchor.constraint(equalToConstant: 56),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: subtitleL.bottomAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: bottomButton.topAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
     
    }
    
    @objc func addLanguage() {
        output.addNewLanguage()
        print("1")
    }
}

extension StartAppViewController: UICollectionViewDelegate {
    
}

extension StartAppViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as? LanguageCell ?? UICollectionViewCell()
        
        return cell
    }
}



extension StartAppViewController: StartAppViewInput {}
