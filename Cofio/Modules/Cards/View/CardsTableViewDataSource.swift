//
//  CardsTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

protocol CardsTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellDataModel>
}

final class CardsTableViewDataSource: CardsTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, CardCellDataModel>(tableView: tableview) { tableView, indexPath, card in
            let cell = tableView.reuse(CardsCell.self, indexPath)
            let displayData = CardsCell.DisplayData(meaning: card.meaning,
                                                    translation: card.translation)
            cell.configure(with: displayData)
            return cell
        }

        return tableViewDataSource
    }
}
