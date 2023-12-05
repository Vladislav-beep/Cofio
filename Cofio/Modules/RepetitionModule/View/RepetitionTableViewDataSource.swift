//
//  RepetitionTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

protocol RepetitionTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, RepetitionCellsDataModel>
}

final class RepetitionTableViewDataSource: RepetitionTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, RepetitionCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, RepetitionCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            
            switch cellType {
            case .theme(let model):
                let cell = tableView.reuse(RepetitionCell.self, indexPath)
                let displayData = RepetitionCell.DisplayData(
                    title: model.title,
                    subtitle: model.subtitle,
                    date: model.dateString,
                    backgroundColor: model.backgroundColor
                )
                cell.configure(with: displayData)
                return cell
                
            case .empty(let model):
                let cell = tableview.reuse(EmptyCell.self, indexPath)
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
