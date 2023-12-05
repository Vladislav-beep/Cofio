//
//  MainModuleCellViewModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 05.08.2022.
//

import UIKit

enum MainModuleCellsDataModel: Hashable {
    case subtitle(SubtitleCellDataModel)
    case collection(MainModuleCellViewModel)
    case empty(MainModuleEmptyCellViewModel)
}

struct SubtitleCellDataModel: Hashable {
    let subtitle: String
}

struct MainModuleCellViewModel: Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
    let creationDate: Date
}

struct MainModuleEmptyCellViewModel: Hashable {
    let title: String
    let subtitle: String
    let icon: String
}
