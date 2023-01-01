//
//  CardCellDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

enum CardCellsDataModel: Hashable {
    case card(CardCellDataModel)
    case empty(CardEmptyCellDataModel)
}

struct CardCellDataModel: Hashable {
    let definition: String
    let description: String
}

struct CardEmptyCellDataModel: Hashable {
    let title: String
}
