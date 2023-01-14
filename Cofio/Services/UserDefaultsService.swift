//
//  UserDefaultsService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 07.01.2023.
//

import Foundation

protocol UserDefaultsServiceProtocol {
    func save(repetitionType: RepetitionType)
    func getRepetitionType() -> RepetitionType?
    func clearData()
}

final class UserDefaultsService: UserDefaultsServiceProtocol {
    
    // MARK: Private properties
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: Public
    
    func save(repetitionType: RepetitionType) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(repetitionType)
            userDefaults.set(data, forKey: "repetitionType")
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func getRepetitionType() -> RepetitionType? {
        if let data = userDefaults.data(forKey: "repetitionType") {
            do {
                let decoder = JSONDecoder()
                let rep = try decoder.decode(RepetitionType.self, from: data)
                return rep
                // return userDefaults.object(forKey: "repetitionType") as? RepetitionType ?? .long
            } catch {
                print("Unable to Decode Note (\(error))")
                return nil
            }
        }
        return nil
    }
    
    func clearData() {
        userDefaults.removeObject(forKey: "repetitionType")
    }
}
