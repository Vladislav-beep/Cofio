//
//  DymmyData.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class DymmyData {
    
    static func getDymmyData() -> [Language] {
        
        let words1 = [
            Word(meaning: "Dog", translation: "Собака"),
            Word(meaning: "Cat", translation: "Кошка"),
            Word(meaning: "Table", translation: "Стол"),
            Word(meaning: "Cup", translation: "Кружка")
        ]
        
        let words2 = [
            Word(meaning: "Computer", translation: "Компьютер"),
        ]
        
        let words3 = [Word]()
        
        let card1 = [Card(words: words1)]
        let card2 = [Card(words: words2)]
        let card3 = [Card(words: words3)]
        
        let collection1 = CardCollection(name: "Животные", repeats: 0, repeatDate: Date(), isRepeatComplete: false, cards: card1)
        let collection2 = CardCollection(name: "Техника", repeats: 2, repeatDate: Date(timeIntervalSinceNow: 20000), isRepeatComplete: false, cards: card2)
        let collection3 = CardCollection(name: "Пустой", repeats: 5, repeatDate: Date(), isRepeatComplete: true, cards: card3)
        
        let data = [
            Language.init(name: "Английский", collections: [collection1]),
            Language.init(name: "Хинди", collections: [collection2, collection3]),
            Language.init(name: "Арабский", collections: [])
        ]
        
        return data
    }
}
