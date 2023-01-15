//
//  OnboardingViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

import UIKit

protocol OnboardingViewDataSourceProtocol {
    func makeDataSource(for tableview: UICollectionView) -> UICollectionViewDiffableDataSource<Int, OnboardingCellDataModel>
}

final class OnboardingViewDataSource: OnboardingViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<Int, OnboardingCellDataModel> {
        let collectionViewDataSource = UICollectionViewDiffableDataSource<Int, OnboardingCellDataModel>(collectionView: collectionView) { collectionView, indexPath, model in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as? OnboardingCell
            let displayData = OnboardingCell.DisplayData(
                image: model.image,
                title: model.title,
                subtitle: model.subtitle
            )
            cell?.configure(displayData: displayData)
            return cell
        }
        return collectionViewDataSource
    }
}
