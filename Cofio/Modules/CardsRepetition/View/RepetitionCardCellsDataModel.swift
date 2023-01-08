//
//  RepetitionCardCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

import Foundation

struct RepetitionCardCellDataModel: Hashable, Identifiable {
    let id: UUID
    let definition: String
    let description: String
    let descriptionShown: Bool
}
