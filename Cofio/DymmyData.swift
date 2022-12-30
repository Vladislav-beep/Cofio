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
        
        let card1 = [Card1(words: words1)]
        let card2 = [Card1(words: words2)]
        let card3 = [Card1(words: words3)]
        let card4 = [Card1(words: words4)]
        let card5 = [Card1(words: words5)]
        let card6 = [Card1(words: words6)]
        
        
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
    
    
//    static func getLanguages() -> [MainModuleCellsDataModel] {
//        
//        return [
//            .title(.init(title: "main_module_title"~)),
//            .subtitle(.init(subtitle: "main_module_subtitle"~)),
//            .collection(.init(title: "German", collectionsCount: 2, image: "life")),
//            .collection(.init(title: "Mathematiican exam", collectionsCount: 34, image: "clock")),
//            .collection(.init(title: "wajncsjncjnasjnascjncasjncs", collectionsCount: 0, image: "calendar"))
//        ]
//    }
    
    static func getCollectionCells() -> [ThemesCellsDataModel] {
        return [
            .statics(.init(title: "LOL")),
            .header(.init(title: "Темы")),
            .card(.init(title: "Кухня", subtitle: "sdvvds", totalRepeats: 5, repeats: 3)),
            .card(.init(title: "Автомобиль", subtitle: "efac", totalRepeats: 10, repeats: 8)),
            .card(.init(title: "Домашние дела", subtitle: "asvdc", totalRepeats: 7, repeats: 1)),
            .card(.init(title: "Путешествия", subtitle: "asvz", totalRepeats: 7, repeats: 3))
        ]
    }
    
    static func getCardCellDataModel() -> [CardCellDataModel] {
        return [
            .init(meaning: "Dog", translation: "Собака бабака пукака тупака сусука дыуаьдьдыиьдвыьдмыывавымывыв лдвылвылыалы лылмылыплымлымллылл лымьлтыилмьылылмымл ылпоьым влвлвлвл лвлвлвлвл влвлвлвтпьлвв влвл reggwr gw few ewg ewg eg wegwweggewgwe gew gewge wg e gew eg egegwegwgew egw gewgew gew ge  egw gew egw eg gewgew ge ge ge ge ge ge egw egwegwegwegw egw  ge eg geg egegeeg  eg ge eg ge eggew egw gew gew gwe gwe egw egw gew eg  egw egw eg egweg weg wge w gew egw egwegwmegwkmegwkmegwi iewjiewijewgewgijewgiewgijewgijewgijeweweew eg eg  g egw egw eg w egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw  egw egw egw egw egwegw egwegwegwegegwegw дыиьдвыьдмыывавымывыв лдвылвылыалы лылмылыплымлымллылл лымьлтыилмьылылмымл ылпоьым влвлвлвл лвлвлвлвл влвлвлвтпьлвв влвл reggwr gw few ewg ewg eg wegwweggewgwe gew gewge wg e gew eg egegwegwgew egw gewgew gew ge  egw gew egw eg gewgew ge ge ge ge ge ge egw egwegwegwegw egw  ge eg geg egegeeg  eg ge eg ge eggew egw gew gew gwe gwe egw egw gew eg  egw egw eg egweg weg wge w gew egw egwegwmegwkmegwkmegwi iewjiewijewgewgijewgiewgijewgijewgijeweweew eg eg  g egw egw eg w egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw  egw egw egw egw egwegw egwegwegwegegwegw дыиьдвыьдмыывавымывыв лдвылвылыалы лылмылыплымлымллылл лымьлтыилмьылылмымл ылпоьым влвлвлвл лвлвлвлвл влвлвлвтпьлвв влвл reggwr gw few ewg ewg eg wegwweggewgwe gew gewge wg e gew eg egegwegwgew egw gewgew gew ge  egw gew egw eg gewgew ge ge ge ge ge ge egw egwegwegwegw egw  ge eg geg egegeeg  eg ge eg ge eggew egw gew gew gwe gwe egw egw gew eg  egw egw eg egweg weg wge w gew egw egwegwmegwkmegwkmegwi iewjiewijewgewgijewgiewgijewgijewgijeweweew eg eg  g egw egw eg w egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw  egw egw egw egw egwegw egwegwegwegegwegw дыиьдвыьдмыывавымывыв лдвылвылыалы лылмылыплымлымллылл лымьлтыилмьылылмымл ылпоьым влвлвлвл лвлвлвлвл влвлвлвтпьлвв влвл reggwr gw few ewg ewg eg wegwweggewgwe gew gewge wg e gew eg egegwegwgew egw gewgew gew ge  egw gew egw eg gewgew ge ge ge ge ge ge egw egwegwegwegw egw  ge eg geg egegeeg  eg ge eg ge eggew egw gew gew gwe gwe egw egw gew eg  egw egw eg egweg weg wge w gew egw egwegwmegwkmegwkmegwi iewjiewijewgewgijewgiewgijewgijewgijeweweew eg eg  g egw egw eg w egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw  egw egw egw egw egwegw egwegwegwegegwegw дыиьдвыьдмыывавымывыв лдвылвылыалы лылмылыплымлымллылл лымьлтыилмьылылмымл ылпоьым влвлвлвл лвлвлвлвл влвлвлвтпьлвв влвл reggwr gw few ewg ewg eg wegwweggewgwe gew gewge wg e gew eg egegwegwgew egw gewgew gew ge  egw gew egw eg gewgew ge ge ge ge ge ge egw egwegwegwegw egw  ge eg geg egegeeg  eg ge eg ge eggew egw gew gew gwe gwe egw egw gew eg  egw egw eg egweg weg wge w gew egw egwegwmegwkmegwkmegwi iewjiewijewgewgijewgiewgijewgijewgijeweweew eg eg  g egw egw eg w egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw  egw egw egw egw egwegw egwegwegwegegwegw дыиьдвыьдмыывавымывыв лдвылвылыалы лылмылыплымлымллылл лымьлтыилмьылылмымл ылпоьым влвлвлвл лвлвлвлвл влвлвлвтпьлвв влвл reggwr gw few ewg ewg eg wegwweggewgwe gew gewge wg e gew eg egegwegwgew egw gewgew gew ge  egw gew egw eg gewgew ge ge ge ge ge ge egw egwegwegwegw egw  ge eg geg egegeeg  eg ge eg ge eggew egw gew gew gwe gwe egw egw gew eg  egw egw eg egweg weg wge w gew egw egwegwmegwkmegwkmegwi iewjiewijewgewgijewgiewgijewgijewgijeweweew eg eg  g egw egw eg w egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw egw  egw egw egw egw egwegw egwegwegwegegwegw"),
            .init(meaning: "Aggregation", translation: "Агрегат"),
            .init(meaning: "sgrbgsv dsvss sdvsd advadv svsvsv svvddsvsvd", translation: "sbvsdv"),
            .init(meaning: "favdvavda", translation: "avdavdvadva"),
            .init(meaning: "davadvad", translation: "svdvsvs"),
            .init(meaning: "svsvvsvs", translation: "vavsd")
        ]
    }
    
    static func getRepetitionCellDataModel() -> [RepetitionCellDataModel] {
        return [
            .init(title: "Кухня", subtitle: "Loleav", date: "14 июля", backgroundColor: .lightGreen),
            .init(title: "Кухня", subtitle: "Lol", date: "15 июля", backgroundColor: .lightGreen),
            .init(title: "Кухняfffff", subtitle: "Lol", date: "16 июля", backgroundColor: .darkGreen),
            .init(title: "Кухня", subtitle: "Lolfffff", date: "20 июля", backgroundColor: .lightGreen),
            .init(title: "Кухня", subtitle: "Lol", date: "22 июля", backgroundColor: .darkRed)
        ]
    }
}
