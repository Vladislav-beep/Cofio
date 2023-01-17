//
//  SettingsTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.01.2023.
//

import UIKit

protocol SettingsTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, SettingsCellsDataModel>
}

final class SettingsTableViewDataSource: SettingsTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, SettingsCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, SettingsCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            switch cellType {
            case .learning(let model):
                let cell = tableview.reuse(SettingsCell.self, indexPath)
                let displayData = SettingsCell.DisplayData(
                    title: model.title,
                    isImageShown: model.isImageShown
                )
                cell.configure(with: displayData)
                return cell
                
            case .onboarding(let model):
                let cell = tableview.reuse(SettingsCell.self, indexPath)
                let displayData = SettingsCell.DisplayData(
                    title: model.title,
                    isImageShown: model.isImageShown
                    )
                cell.configure(with: displayData)
                return cell
                
            case .deleteAllData(let model):
                let cell = tableview.reuse(SettingsCell.self, indexPath)
                    let displayData = SettingsCell.DisplayData(
                        title: model.title,
                        isImageShown: model.isImageShown
                        )
                cell.configure(with: displayData)
                return cell
            }
        }
        
        return tableViewDataSource
    }
}
