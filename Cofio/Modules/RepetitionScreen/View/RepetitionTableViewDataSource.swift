//
//  RepetitionTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

protocol RepetitionTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, RepetitionCellDataModel>
}

final class RepetitionTableViewDataSource: RepetitionTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, RepetitionCellDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, RepetitionCellDataModel>(tableView: tableview) { tableView, indexPath, collection in
            let cell = tableView.reuse(RepetitionCell.self, indexPath)
            let displayData = RepetitionCell.DisplayData(title: collection.title,
                                                         repeats: collection.repeats,
                                                         nextRepeat: collection.nextRepeat)
            cell.configure(with: displayData)
            return cell
        }

        return tableViewDataSource
    }
}
