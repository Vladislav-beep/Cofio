//
//  MainTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.07.2022.
//

import UIKit

protocol MainTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, MainModuleCellsDataModel>
}

final class MainTableViewDataSource: MainTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, MainModuleCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, MainModuleCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            switch cellType {
            case .subtitle(let model):
                let cell = tableview.reuse(MainModuleSubtitleCell.self, indexPath)
                let displayData = MainModuleSubtitleCell.DisplayData(subtitle: model.subtitle)
                cell.configure(with: displayData)
                return cell
                
                
            case .collection(let model):
                let cell = tableview.reuse(MainModuleCell.self, indexPath)
                let displayData = MainModuleCell.DisplayData(
                    title: model.title,
                    subtitle: model.subtitle,
                    icon: model.image
                )
                cell.configure(with: displayData)
                return cell
                
            case .empty(let model):
                let cell = tableview.reuse(MainModuleEmptyCell.self, indexPath)
                let displayData = MainModuleEmptyCell.DisplayData(title: model.title)
                cell.configure(with: displayData)
                return cell
            }
        }

        return tableViewDataSource
    }
}
