//
//  CardsTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

protocol CardsTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellsDataModel>
}

final class CardsTableViewDataSource: CardsTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, CardCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            
            switch cellType {
            case .card(let model):
                let cell = tableView.reuse(CardsCell.self, indexPath)
                let displayData = CardsCell.DisplayData(definition: model.definition,
                                                        description: model.description)
                cell.configure(with: displayData)
                return cell
                
            case .empty(let model):
                let cell = tableView.reuse(EmptyCell.self, indexPath)
                let displayData = EmptyCell.DisplayData(
                    title: model.title,
                    subtitle: model.subtitle,
                    icon: model.icon
                )
                cell.configure(with: displayData)
                return cell
            }
        }

        return tableViewDataSource
    }
}
