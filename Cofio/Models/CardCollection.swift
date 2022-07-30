//
//  CardCollection.swift
//  Cofio
//
//  Created by Владислав Сизонов on 27.07.2022.
//

import Foundation

struct CardCollection: Equatable, Hashable {
    let name: String
    let repeats: Int
    let repeatDate: Date
    let isRepeatComplete: Bool
    let cards: [Card]
}
