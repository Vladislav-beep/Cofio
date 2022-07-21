//
//  ViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 19.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
        let cool = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cool.translatesAutoresizingMaskIntoConstraints = false
        cool.register(LanguageCell.self, forCellWithReuseIdentifier: "cell")
        cool.delegate = self
        cool.dataSource = self
       // cool.backgroundColor = .red
        return cool
    }()
    
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить язык", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.setTitleColor(UIColor(red: 90/255, green: 34/255, blue: 102/255, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleL)
        NSLayoutConstraint.activate([
            titleL.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleL.heightAnchor.constraint(equalToConstant: 70)
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
            collectionView.topAnchor.constraint(equalTo: subtitleL.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: bottomButton.topAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
     
    }
    
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.55))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as? LanguageCell ?? UICollectionViewCell()
        
        return cell
    }
}
