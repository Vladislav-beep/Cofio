//
//  LearningTableViewDataSource.swift
//  Cofio
//
//  Created by Владислав Сизонов on 11.01.2023.
//

import UIKit

protocol LearningTableViewDataSourceProtocol {
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, LearningCellsDataModel>
}

final class LearningTableViewDataSource: LearningTableViewDataSourceProtocol {
    
    // MARK: Public
    
    func makeDataSource(for tableview: UITableView) -> UITableViewDiffableDataSource<Int, LearningCellsDataModel> {
        let tableViewDataSource = UITableViewDiffableDataSource<Int, LearningCellsDataModel>(tableView: tableview) { tableView, indexPath, cellType in
            switch cellType {
//            case .learning(let model):
//                let cell = tableview.reuse(SettingsCell.self, indexPath)
//                let displayData = SettingsCell.DisplayData(title: model.title)
//                cell.configure(with: displayData)
//                return cell
//
//            case .onboarding(let model):
//                let cell = tableview.reuse(SettingsCell.self, indexPath)
//                let displayData = SettingsCell.DisplayData(title: model.title)
//                cell.configure(with: displayData)
//                return cell
            case .long(let model):
                let cell = tableview.reuse(LearningCell.self, indexPath)
                let displayData = LearningCell.DisplayData(
                    title: model.title,
                    subtitle: model.subtitle,
                    isOn: model.isOn
                )
                cell.configure(with: displayData)
                return cell
                
            case .week(let model):
                let cell = tableview.reuse(LearningCell.self, indexPath)
                let displayData = LearningCell.DisplayData(
                    title: model.title,
                    subtitle: model.subtitle,
                    isOn: model.isOn
                )
                cell.configure(with: displayData)
                return cell
            }
        }

        return tableViewDataSource
    }
}
