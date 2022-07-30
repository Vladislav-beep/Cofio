//
//  CardsCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

enum CardsCellsDataModel: Hashable {
    case statics(StaticsCellDataModel)
    case card(CardsCellDataModel)
}

struct StaticsCellDataModel: Hashable {
    let title: String
}

struct CardsCellDataModel: Hashable {
    let title: String
    let subtitle: String
}
