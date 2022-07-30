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
        
        let words4 = [
            Word(meaning: "Fork", translation: "Вилка"),
            Word(meaning: "Spoon", translation: "Лошка"),
            Word(meaning: "Knife", translation: "Нож"),
            Word(meaning: "Plate", translation: "Тарелка"),
            Word(meaning: "Fork", translation: "Вилка"),
            Word(meaning: "Spoon", translation: "Лошка"),
            Word(meaning: "Knife", translation: "Нож"),
            Word(meaning: "Plate", translation: "Тарелка")
        ]
        
        let words5 = [
            Word(meaning: "SMS", translation: "СМС"),
            Word(meaning: "Message", translation: "Сообщение")
        ]
        
        let words6 = [
            Word(meaning: "SMS", translation: "СМС"),
            Word(meaning: "Message", translation: "Сообщение"),
            Word(meaning: "Building", translation: "Здание"),
        ]
        
        let card1 = [Card(words: words1)]
        let card2 = [Card(words: words2)]
        let card3 = [Card(words: words3)]
        let card4 = [Card(words: words4)]
        let card5 = [Card(words: words5)]
        let card6 = [Card(words: words6)]
        
        
        let collection1 = CardCollection(name: "Животные", repeats: 0, repeatDate: Date(), isRepeatComplete: false, cards: card1)
        let collection2 = CardCollection(name: "Техника", repeats: 2, repeatDate: Date(timeIntervalSinceNow: 20000), isRepeatComplete: false, cards: card2)
        let collection3 = CardCollection(name: "Пустой", repeats: 5, repeatDate: Date(), isRepeatComplete: true, cards: card3)
        let collection4 = CardCollection(name: "Кухня", repeats: 6, repeatDate: Date(), isRepeatComplete: false, cards: card4)
        let collection5 = CardCollection(name: "СМС", repeats: 2, repeatDate: Date(timeIntervalSinceNow: 20000), isRepeatComplete: false, cards: card5)
        let collection6 = CardCollection(name: "Постройки", repeats: 5, repeatDate: Date(), isRepeatComplete: true, cards: card6)
        
        let data = [
            Language.init(name: "Английский", collections: [collection1]),
            Language.init(name: "Хинди", collections: [collection2, collection3]),
            Language.init(name: "Арабский", collections: []),
            Language.init(name: "Немецкий", collections: [collection4]),
            Language.init(name: "Финский", collections: [collection5, collection6]),
            Language.init(name: "Японский", collections: [collection5, collection6, collection2, collection3]),
        ]
        
        return data
    }
}
