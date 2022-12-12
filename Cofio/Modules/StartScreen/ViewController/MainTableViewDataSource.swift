//
//  MainTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.07.2022.
//

import UIKit

protocol MainTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, MainModuleCellViewModel>
}

final class MainTableViewDataSource: MainTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, MainModuleCellViewModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, MainModuleCellViewModel>(tableView: tableview) { tableView, indexPath, language in
            let cell = tableView.reuse(MainModuleCell.self, indexPath)
            let displayData = MainModuleCell.DisplayData(title: language.title, collectionsCount: language.collectionsCount)
            cell.configure(with: displayData)
            
            return cell
        }

        return tableViewDataSource
    }
}
