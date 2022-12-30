//
//  MainModuleCellViewModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 05.08.2022.
//

import UIKit

enum MainModuleCellsDataModel: Hashable {
    case title(TitleCellDataModel)
    case subtitle(SubtitleCellDataModel)
    case collection(MainModuleCellViewModel)
}

struct TitleCellDataModel: Hashable {
    let title: String
}

struct SubtitleCellDataModel: Hashable {
    let subtitle: String
}

struct MainModuleCellViewModel: Hashable {
    let title: String
    let subtitle: String
    let image: String
}
