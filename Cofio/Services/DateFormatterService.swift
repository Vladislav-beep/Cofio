//
//  DateFormatterService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 14.01.2023.
//

import Foundation

protocol DateFormatterServiceProtocol {
    func dateToString(date: Date) -> String
}

final class DateFormatterService: DateFormatterServiceProtocol {
    
    // MARK: Private
    
    private let dateFormatter = DateFormatter()
    
    // MARK: Public
    
    func dateToString(date: Date) -> String {
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
