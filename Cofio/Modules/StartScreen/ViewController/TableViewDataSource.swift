//
//  TableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.07.2022.
//

import UIKit

protocol TableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, LanguageCell.DisplayData>
}

final class TableViewDataSource: TableViewDataSourceProtocol {
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, LanguageCell.DisplayData> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, LanguageCell.DisplayData>(tableView: tableview) { tableView, indexPath, dispalyData in
            let cell = tableView.reuse(LanguageCell.self, indexPath)
            cell.configure(with: dispalyData)
            
            return cell
        }

        return tableViewDataSource
    }
}
