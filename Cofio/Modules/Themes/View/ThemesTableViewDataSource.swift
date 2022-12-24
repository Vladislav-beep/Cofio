//
//  ThemesTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

protocol ThemesTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, ThemesCellsDataModel>
}

final class ThemesTableViewDataSource: ThemesTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, ThemesCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, ThemesCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            switch cellType {
            case .statics(let model):
                let cell = tableview.reuse(StatisticsCell.self, indexPath)
                let displayData = StatisticsCell.DisplayData(title: model.title)
                cell.configure(with: displayData)
                return cell
                
            case .header(let model):
                let cell = tableview.reuse(HeaderCell.self, indexPath)
                let displayData = HeaderCell.DisplayData(title: model.title)
                cell.configure(with: displayData)
                return cell
                
            case .card(let model):
                let cell = tableview.reuse(ThemesCell.self, indexPath)
                let displayData = ThemesCell.DisplayData(title: model.title,
                                                         subtitle: model.subtitle,
                                                         repeats: model.repeats)
                cell.configure(with: displayData)
                return cell
            }
        }

        return tableViewDataSource
    }
}
