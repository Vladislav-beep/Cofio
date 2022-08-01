//
//  CollectionsCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

enum CollectionsCellsDataModel: Hashable {
    case statics(StaticsCellDataModel)
    case card(CollectionsCellDataModel)
}

struct StaticsCellDataModel: Hashable {
    let title: String
}

struct CollectionsCellDataModel: Hashable {
    let title: String
    let cardsCount: Int
    let repeats: Int
}
