//
//  CardsCollectionViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 04.01.2023.
//

import UIKit

protocol CardsCollectionViewDataSourceProtocol {
    func makeDataSource(for tableview: UICollectionView) -> UICollectionViewDiffableDataSource<Int, RepetitionCardCellsDataModel>
}

final class CardsCollectionViewDataSource: CardsCollectionViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<Int, RepetitionCardCellsDataModel> {
        let collectionViewDataSource = UICollectionViewDiffableDataSource<Int, RepetitionCardCellsDataModel>(collectionView: collectionView) { collectionView, indexPath, cellType in
            switch cellType {
            case .card(let model):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repetitionCardsCell", for: indexPath) as? RepetitionCardsCell
                let displayData = RepetitionCardsCell.DisplayData(definition: model.definition,
                                                                  description: model.description,
                                                                  descriptionShown: model.descriptionShown)
                cell?.configure(displayData: displayData)
                return cell
                
            case .empty(let model):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repetitionEmptyCardsCell", for: indexPath) as? RepetitionEmptyCardsCell
                let displayData = RepetitionEmptyCardsCell.DisplayData(title: model.title)
                cell?.configure(with: displayData)
                return cell
            }
        }
        
        return collectionViewDataSource
    }
    
//    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellsDataModel> {
//        let tableViewDataSource = UITableViewDiffableDataSource<Int, CardCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
//
//            switch cellType {
//            case .card(let model):
//                let cell = tableView.reuse(CardsCell.self, indexPath)
//                let displayData = CardsCell.DisplayData(definition: model.definition,
//                                                        description: model.description)
//                cell.configure(with: displayData)
//                return cell
//
//            case .empty(let model):
//                let cell = tableView.reuse(CardsEmptyCell.self, indexPath)
//                let displayData = CardsEmptyCell.DisplayData(title: model.title)
//                cell.configure(with: displayData)
//                return cell
//            }
//        }
//
//        return tableViewDataSource
//    }
}
