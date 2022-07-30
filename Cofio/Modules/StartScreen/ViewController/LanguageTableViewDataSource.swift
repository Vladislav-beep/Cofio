//
//  LanguageTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.07.2022.
//

import UIKit

protocol LanguageTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, Language>
}

final class LanguageTableViewDataSource: LanguageTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, Language> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, Language>(tableView: tableview) { tableView, indexPath, language in
            let cell = tableView.reuse(LanguageCell.self, indexPath)
            let displayData = LanguageCell.DisplayData(title: language.name, collectionsCount: language.collections.count)
            cell.configure(with: displayData)
            
            return cell
        }

        return tableViewDataSource
    }
}
