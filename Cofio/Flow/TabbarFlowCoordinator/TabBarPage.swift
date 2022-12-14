//
//  TabBarPage.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import Foundation

enum TabBarPage {
    case main
    case repetition
    case settings
    case statistics

    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .repetition
        case 2:
            self = .statistics
        case 3:
            self = .settings
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return NSLocalizedString("main_tab", comment: "")
        case .repetition:
            return "Повторение"
        case .settings:
            return "Статистика"
        case .statistics:
            return "Настройки"
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
        case .statistics:
            return 3
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}
