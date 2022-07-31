//
//  CardsTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

protocol CardsTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CollectionsCellsDataModel>
}

final class CardsTableViewDataSource: CollectionsTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, Card> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, Card>(tableView: tableview) { tableView, indexPath, card in
            let cell = tableView.reuse(LanguageCell.self, indexPath)
            let displayData = LanguageCell.DisplayData(title: language.name, collectionsCount: language.collections.count)
            cell.configure(with: displayData)
            
            return cell
        }

        return tableViewDataSource
    }
}

