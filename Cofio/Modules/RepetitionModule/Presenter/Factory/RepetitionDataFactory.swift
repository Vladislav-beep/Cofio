//
//  RepetitionDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 02.01.2023.
//

import Foundation
import UIKit

protocol RepetitionDataFactoryProtocol {
    
    func dataFromThemes(themes: [Theme]) -> [RepetitionCellDataModel]
}

final class RepetitionDataFactory: RepetitionDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromThemes(themes: [Theme]) -> [RepetitionCellDataModel] {
        var themeCellsModel: [RepetitionCellDataModel] = []
        var newThemes = themes
        newThemes.sort { $0.repeatDate ?? Date() < $1.repeatDate ?? Date() }
        
        for theme in newThemes {
            let subtitle = makeSubtitle(
                repeats: theme.repeats,
                repeatDate: theme.repeatDate ?? Date()
            )
            let date = makeDate(repeatDate: theme.repeatDate ?? Date())
            let backgroundColor = setupBackground(repeatDate: theme.repeatDate ?? Date())
            let themeCell = RepetitionCellDataModel(
                title: theme.name ?? "",
                subtitle: subtitle,
                date: date,
                backgroundColor: backgroundColor
            )
            themeCellsModel.append(themeCell)
        }
        
        return themeCellsModel
    }
    
    // MARK: Private
    
    private func makeSubtitle(repeats: Int64, repeatDate: Date) -> String {
        // FIXME: repeats can be less or more than 7, don't use raw Int
        if repeats == 6 {
            return "repetition_module_last_repeat"~
        }
        
        if Calendar.current.isDateInToday(repeatDate) {
            return "repetition_module_needs_repeat"~
        } else if Calendar.current.isDateInYesterday(repeatDate) || repeatDate < Date() {
            return "repetition_module_needs_repeat_past"~
        }
        
        return "repetition_module_needs_repeat"~
    }
    
    private func makeDate(repeatDate: Date) -> String {
        if Calendar.current.isDateInToday(repeatDate) {
            return "repetition_module_today"~
        } else if Calendar.current.isDateInYesterday(repeatDate) {
            return "repetition_module_yesteday"~
        } else if Calendar.current.isDateInTomorrow(repeatDate) {
            return "repetition_module_tomorrow"~
        }
        
        return dateToString(date: repeatDate)
    }
    
    private func setupBackground(repeatDate: Date) -> UIColor {
        if repeatDate > Date() {
            return .darkGreen
        } else if Calendar.current.isDateInToday(repeatDate) {
            return .lightGreen
        } else {
            return .lightRed
        }
    }
    
    private func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
