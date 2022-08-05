//
//  LanguageTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.07.2022.
//

import UIKit

protocol LanguageTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, StartAppCellViewModel>
}

final class LanguageTableViewDataSource: LanguageTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, StartAppCellViewModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, StartAppCellViewModel>(tableView: tableview) { tableView, indexPath, language in
            let cell = tableView.reuse(LanguageCell.self, indexPath)
            let displayData = LanguageCell.DisplayData(title: language.title, collectionsCount: language.collectionsCount)
            cell.configure(with: displayData)
            
            return cell
        }

        return tableViewDataSource
    }
}
