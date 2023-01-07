//
//  RepetitionCardCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

import Foundation

enum RepetitionCardCellsDataModel: Hashable {
    case card(RepetitionCardCellDataModel)
    case empty(RepetitionCardEmptyCellDataModel)
}

struct RepetitionCardCellDataModel: Hashable, Identifiable {
    let id: UUID
    let definition: String
    let description: String
    let descriptionShown: Bool
}

struct RepetitionCardEmptyCellDataModel: Hashable {
    let title: String
}
