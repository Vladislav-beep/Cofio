//
//  ThemesDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.12.2022.
//

import Foundation

protocol ThemesDataFactoryProtocol {
    
    func dataFromThemes(themesDict: [Theme: Int]) -> [ThemesCellsDataModel]
}

final class ThemesDataFactory: ThemesDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromThemes(themesDict: [Theme: Int]) -> [ThemesCellsDataModel] {
        var themeCellsModel: [ThemesCellsDataModel] = [
            .statics(.init(title: "")),
            .header(.init(title: "theme_module_header"~))
        ]
        let keys = themesDict.keys.sorted { $0.name ?? "" > $1.name ?? "" }
        for theme in keys {
            let themeCell = ThemesCellsDataModel.card(
                .init(title: theme.name ?? "",
                      subtitle: countCards(count: themesDict[theme] ?? 0),
                      totalRepeats: 7,
                      repeats: 0)
            )
            themeCellsModel.append(themeCell)
        }
        
        return themeCellsModel
    }
    
    // MARK: Private

    private func countCards(count: Int) -> String {
        let formatString : String = NSLocalizedString("collection cards count",
                                                      comment: "")
        let resultString : String = String.localizedStringWithFormat(formatString, count)
        return resultString
    }
}
