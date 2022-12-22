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
    
    private lazy var closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
    private lazy var iconsCollectionView: IconsCollectionView = {
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
        view.backgroundColor = .blue
        
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(iconsCollectionView)
        NSLayoutConstraint.activate([
            iconsCollectionView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            iconsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iconsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            iconsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Actions
    
    @objc func close() {
        output.closeModule()
    }
}

// MARK: - ChooseIconViewInput

extension ChooseIconViewController: ChooseIconViewInput {}

// MARK: - UICollectionViewDelegate

extension ChooseIconViewController: UICollectionViewDelegate {

}

// MARK: - CollectionViewDataSource

extension ChooseIconViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell",
                                                      for: indexPath) as? IconCell
        
        return cell ?? UICollectionViewCell()
    }
}
