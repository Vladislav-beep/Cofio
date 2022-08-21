//
//  RepetitionCellDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

struct RepetitionCellDataModel: Hashable {
    let title: String
    let repeats: Int
    let nextRepeat: String
    let repeatDate: Date
}
