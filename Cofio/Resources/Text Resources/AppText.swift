//
//  AppText.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

struct AppText {
    
    enum Common: String {
        case close = "Закрыть"
    }
    
    enum StartAppScreen: String {
        case title = "Иностранные языки"
        case subtitle = "Изучение иностранных языков с помощью карточек для запоминания и пополнения лексики"
        case buttonTitle = "Добавить язык"
        case hindi = "Хинди"
    }
    
    enum NewLanguage: String {
        case title = "Выберите язык"
        case buttonTitle = "Добавить"
    }
}
