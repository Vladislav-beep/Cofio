//
//  UserDefaultsService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 07.01.2023.
//

import Foundation

protocol UserDefaultsServiceProtocol {
    func save(repetitionType: RepetitionType)
    func getRepetitionType() -> RepetitionType
    func clearData()
}

final class UserDefaultsService: UserDefaultsServiceProtocol {
    
    // MARK: Private properties
    
    private lazy var userDefaults = UserDefaults.standard
    
    // MARK: Public
    
    func save(repetitionType: RepetitionType) {
        userDefaults.set(repetitionType, forKey: "repetitionType")
    }
    
    func getRepetitionType() -> RepetitionType {
        return userDefaults.object(forKey: "repetitionType") as? RepetitionType ?? .long
    }
    
    func clearData() {
        userDefaults.removeObject(forKey: "repetitionType")
    }
}
