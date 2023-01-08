//
//  ChooseIconViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

import UIKit

final class ChooseIconViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: ChooseIconViewOutput
    
    private let draggableView: UIView = {
        let draggableView = UIView()
        draggableView.backgroundColor = .gray
        draggableView.layer.cornerRadius = 3
        draggableView.translatesAutoresizingMaskIntoConstraints = false
        return draggableView
    }()
    
    private let iconsCollectionView: IconsCollectionView = {
        let iconsCollectionView = IconsCollectionView()
        return iconsCollectionView
    }()

    // MARK: Lifecycle
    
    init(output: ChooseIconViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        iconsCollectionView.dataSource = self
        iconsCollectionView.delegate = self
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(draggableView)
        NSLayoutConstraint.activate([
            draggableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            draggableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            draggableView.heightAnchor.constraint(equalToConstant: 6),
            draggableView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(iconsCollectionView)
        NSLayoutConstraint.activate([
            iconsCollectionView.topAnchor.constraint(equalTo: draggableView.bottomAnchor, constant: 10),
            iconsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iconsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            iconsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - ChooseIconViewInput

extension ChooseIconViewController: ChooseIconViewInput {}

// MARK: - UICollectionViewDelegate

extension ChooseIconViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let choosedIcon = output.getIcons()[indexPath.item]
        output.viewDidTapRow(icon: choosedIcon)
    }
}

// MARK: - CollectionViewDataSource

extension ChooseIconViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output.getIcons().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell",
                                                      for: indexPath) as? IconCell
        let icon = output.getIcons()[indexPath.item]
        cell?.configure(icon: icon)
        
        return cell ?? UICollectionViewCell()
    }
}
