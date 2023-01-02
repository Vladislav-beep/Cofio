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
        
        
        for theme in themes {
            let subtitle = makeSubtitle(repeats: theme.repeats, repeatDate: theme.repeatDate ?? Date())
            let date = makeDate(repeatDate: theme.repeatDate ?? Date())
            let backgroundColor = setupBackground(repeatDate: theme.repeatDate ?? Date())
            let themeCell = RepetitionCellDataModel(title: theme.name ?? "",
                                                    subtitle: subtitle,
                                                    date: date,
                                                    backgroundColor: backgroundColor)
            themeCellsModel.append(themeCell)
        }
        
        return themeCellsModel
    }
    
    // MARK: Private
    
    private func makeSubtitle(repeats: Int64, repeatDate: Date) -> String {
        if repeats == 7 {
            return "Последнее повторение!"
        }
        
        if Calendar.current.isDateInToday(repeatDate) {
            return "Нужно повторить"
        } else if Calendar.current.isDateInYesterday(repeatDate) {
            return "Нужно было повторить"
        }
        
        return "Нужно повторить"
    }
    
    private func makeDate(repeatDate: Date) -> String {
        if Calendar.current.isDateInToday(repeatDate) {
            return "Сегодня"
        } else if Calendar.current.isDateInYesterday(repeatDate) {
            return "Вчера"
        } else if Calendar.current.isDateInTomorrow(repeatDate) {
            return "Завтра"
        }
        
        return "Вфеу"
    }
    
    private func setupBackground(repeatDate: Date) -> UIColor {
        if repeatDate > Date() {
            return .darkGreen
        } else if Calendar.current.isDateInToday(repeatDate) {
            return .lightGreen
        } else {
            return .darkRed
        }
    }
}
