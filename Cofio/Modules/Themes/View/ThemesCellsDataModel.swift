//
//  ThemesCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

enum ThemesCellsDataModel: Hashable {
    case statics(StaticsCellDataModel)
    case header(HeaderCellDataModel)
    case card(ThemesCellDataModel)
    case empty(EmptyCellDataModel)
}

struct StaticsCellDataModel: Hashable {
    let title: String
}

struct HeaderCellDataModel: Hashable {
    let title: String
}

struct ThemesCellDataModel: Hashable {
    let title: String
    let subtitle: String
    let totalRepeats: Int
    let repeats: Int
    let isBeingRepeated: Bool
}
