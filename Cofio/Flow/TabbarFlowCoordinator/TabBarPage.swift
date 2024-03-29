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
    
    // MARK: Lifecycle
    
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
    
    // MARK: Public
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return Strings.Tab.mainTab
            
        case .repetition:
            return Strings.Tab.repetitionTab
            
        case .settings:
            return Strings.Tab.settingsTab
            
        case .statistics:
            return Strings.Tab.statisticsTab
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
            
        case .repetition:
            return 1
            
        case .statistics:
            return 2
            
        case .settings:
            return 3
        }
    }
}
