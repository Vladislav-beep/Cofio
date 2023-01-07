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
            return Date(timeIntervalSinceNow: 259200)
            
        case 3:
            return Date(timeIntervalSinceNow: 604800)
            
        case 4:
            return Date(timeIntervalSinceNow: 1296000)
            
        case 5:
            return Date(timeIntervalSinceNow: 2678400)
            
        case 6:
            return Date(timeIntervalSinceNow: 5443200)
            
        default:
            return Date(timeIntervalSinceNow: 86400)
        }
    }
}
