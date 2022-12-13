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
    
    
    static func getLanguages() -> [MainModuleCellViewModel] {
        
        return [
            .init(title: "Английский", collectionsCount: 0),
            .init(title: "Финский", collectionsCount: 1),
            .init(title: "Японский", collectionsCount: 2),
            .init(title: "Немецкий", collectionsCount: 3),
            .init(title: "Арабский", collectionsCount: 4),
            .init(title: "Хинди", collectionsCount: 5)
        ]
    }
    
    static func getCollectionCells() -> [ThemesCellsDataModel] {
        return [
            .statics(.init(title: "LOL")),
            .header(.init(title: "Сборники")),
            .card(.init(title: "Кухня", cardsCount: 2, repeats: 3)),
            .card(.init(title: "Автомобиль", cardsCount: 5, repeats: 8)),
            .card(.init(title: "Домашние дела", cardsCount: 1, repeats: 1)),
            .card(.init(title: "Путешествия", cardsCount: 0, repeats: 6))
        ]
    }
    
    static func getCardCellDataModel() -> [CardCellDataModel] {
        return [
            .init(meaning: "Dog", translation: "Собака"),
            .init(meaning: "Aggregation", translation: "Агрегат"),
            .init(meaning: "sgrbgsv dsvss sdvsd advadv svsvsv svvddsvsvd", translation: "sbvsdv"),
            .init(meaning: "favdvavda", translation: "avdavdvadva"),
            .init(meaning: "davadvad", translation: "svdvsvs"),
            .init(meaning: "svsvvsvs", translation: "vavsd")
        ]
    }
    
    static func getRepetitionCellDataModel() -> [RepetitionCellDataModel] {
        return [
            .init(title: "Кухня", repeats: 1, nextRepeat: "13 июля", repeatDate: Date()),
            .init(title: "Автомобиль", repeats: 2, nextRepeat: "7 марта", repeatDate: Date()),
            .init(title: "Домашние дела", repeats: 7, nextRepeat: "9 января", repeatDate: Date(timeIntervalSinceNow: -90000)),
            .init(title: "Путешествия", repeats: 8, nextRepeat: "28 ноября", repeatDate: Date(timeIntervalSinceNow: 30000)),
            .init(title: "Kjkrf", repeats: 4, nextRepeat: "28 ноября", repeatDate: Date(timeIntervalSinceNow: 1000000))
        ]
    }
}
