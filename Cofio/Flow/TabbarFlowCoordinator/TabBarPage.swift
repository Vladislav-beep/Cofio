//
//  TabBarPage.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

enum TabBarPage {
    case main
    case repetition
    case settings
    case analytics

    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .repetition
        case 2:
            self = .settings
        case 3:
            self = .analytics
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return "Главная"
        case .repetition:
            return "Повторение"
        case .settings:
            return "Настройки"
        case .analytics:
            return "Статистика"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .repetition:
            return 1
        case .settings:
            return 2
        case .analytics:
            return 3
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}
