//
//  LearningCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 11.01.2023.
//

enum LearningCellsDataModel: Hashable {
    case long(LongCellDataModel)
    case week(WeekCellDataModel)
}

struct LongCellDataModel: Hashable {
    let title: String
    let subtitle: String
    let isOn: Bool
}

struct WeekCellDataModel: Hashable {
    let title: String
    let subtitle: String
    let isOn: Bool
}
