//
//  CardCellDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import Foundation

enum CardCellsDataModel: Hashable {
    case card(CardCellDataModel)
    case empty(EmptyCellDataModel)
}

struct CardCellDataModel: Hashable {
    let definition: String
    let description: String
    let creationDate: Date
}
