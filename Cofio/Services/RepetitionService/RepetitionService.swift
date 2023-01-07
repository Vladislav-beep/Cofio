//
//  RepetitionService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 07.01.2023.
//

import Foundation

protocol RepetitionServiceProtocol {
    
    func getNextRepetDate(repetitionType: RepetitionType, repeatsCount: Int) -> Date
}

final class RepetitionService: RepetitionServiceProtocol {
    
    func getNextRepetDate(repetitionType: RepetitionType, repeatsCount: Int) -> Date {
        guard repetitionType == .long else { return Date(timeIntervalSinceNow: 86400) }
        
        switch repeatsCount {
        case 1:
            return Date(timeIntervalSinceNow: 86400)
            
        case 2:
            return Date(timeIntervalSinceNow: 259300)
            
        case 3:
            return Date(timeIntervalSinceNow: 518400)
            
        case 4:
            return Date(timeIntervalSinceNow: 1036800)
            
        case 5:
            return Date(timeIntervalSinceNow: 1987200)
            
        case 6:
            return Date(timeIntervalSinceNow: 3974400)
            
        default:
            return Date(timeIntervalSinceNow: 86400)
        }
    }
}
