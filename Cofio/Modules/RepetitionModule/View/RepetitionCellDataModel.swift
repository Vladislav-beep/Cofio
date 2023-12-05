//
//  RepetitionCellDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

enum RepetitionCellsDataModel: Hashable {
    case theme(RepetitionCellDataModel)
    case empty(EmptyCellDataModel)
}

struct RepetitionCellDataModel: Hashable {
    let title: String
    let subtitle: String
    let dateString: String
    let date: Date?
    let backgroundColor: UIColor
}
