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
    
    private lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: "Иностранные языки")
        return titleLabel
    }()
    
    private lazy var subtitleLabel: SubtitleLabel = {
        let subtitle = SubtitleLabel(subtitle: "Изучение иностранных языков c кем и чеком и чебуреком с сыром и мясом лол ушцкрпм лдылмттлывм вымо")
        return subtitle
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
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
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
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: bottomButton.topAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
     
    }
    
    @objc func addLanguage() {
        output.addNewLanguage()
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
