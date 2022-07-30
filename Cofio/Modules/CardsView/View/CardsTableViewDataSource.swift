//
//  CardsTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

protocol CardsTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardsCellsDataModel>
}

final class CardsTableViewDataSource: CardsTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardsCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, CardsCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            switch cellType {
            case .statics(let model):
                let cell = tableview.reuse(StatisticsCell.self, indexPath)
                let displayData = StatisticsCell.DisplayData(title: model.title)
                cell.configure(with: displayData)
                return cell
                
            case .card(let model):
                let cell = tableview.reuse(CardsCollectionCell.self, indexPath)
                let displayData = CardsCollectionCell.DisplayData(title: model.title, subtitle: model.subtitle)
                cell.configure(with: displayData)
                return cell
            }
        }

        return tableViewDataSource
    }
}

