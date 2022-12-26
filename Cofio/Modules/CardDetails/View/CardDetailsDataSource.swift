//
//  CardDetailsDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.12.2022.
//

import UIKit

protocol CardDetailsDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellDataModel>
}

final class CardDetailsDataSource: CardDetailsDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, CardCellDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, CardCellDataModel>(tableView: tableview) { tableView, indexPath, card in
            
            let cell = tableview.reuse(CardDetailsCell.self, indexPath)
            let displayData = CardDetailsCell.DisplayData(title: card.meaning, definition: card.translation)
            cell.configure(with: displayData)
            return cell
            
        }
        
        return tableViewDataSource
    }
}
