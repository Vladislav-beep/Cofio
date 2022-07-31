//
//  CollectionsTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

protocol CollectionsTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CollectionsCellsDataModel>
}

final class CollectionsTableViewDataSource: CollectionsTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CollectionsCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, CollectionsCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            switch cellType {
            case .statics(let model):
                let cell = tableview.reuse(StatisticsCell.self, indexPath)
                let displayData = StatisticsCell.DisplayData(title: model.title)
                cell.configure(with: displayData)
                return cell
                
            case .card(let model):
                let cell = tableview.reuse(CollectionCell.self, indexPath)
                let displayData = CollectionCell.DisplayData(title: model.title, subtitle: model.subtitle)
                cell.configure(with: displayData)
                return cell
            }
        }

        return tableViewDataSource
    }
}

