//
//  CardsCollectionViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 04.01.2023.
//

import UIKit

protocol CardsCollectionViewDataSourceProtocol {
    func makeDataSource(for tableview: UICollectionView) -> UICollectionViewDiffableDataSource<Int, RepetitionCardCellDataModel>
}

final class CardsCollectionViewDataSource: CardsCollectionViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<Int, RepetitionCardCellDataModel> {
        let collectionViewDataSource = UICollectionViewDiffableDataSource<Int, RepetitionCardCellDataModel>(collectionView: collectionView) { collectionView, indexPath, card in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repetitionCardsCell", for: indexPath) as? RepetitionCardsCell
            let displayData = RepetitionCardsCell.DisplayData(definition: card.definition,
                                                              description: card.description,
                                                              descriptionShown: card.descriptionShown)
            cell?.configure(displayData: displayData)
            return cell
        }
        return collectionViewDataSource
    }
}
