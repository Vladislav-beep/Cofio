//
//  ThemesDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.12.2022.
//

protocol ThemesDataFactoryProtocol {
    
    func dataFromThemes(themes: [Theme]) -> [ThemesCellsDataModel]
}

final class ThemesDataFactory: ThemesDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromThemes(themes: [Theme]) -> [ThemesCellsDataModel] {
        var themeCellsModel: [ThemesCellsDataModel] = [
            .statics(.init(title: "")),
                .header(.init(title: "theme_module_header"~))
        ]
        
        for theme in themes {
            let themeCell = ThemesCellsDataModel.card(
                .init(title: theme.name ?? "",
                      subtitle: "wev",
                      totalRepeats: 7,
                      repeats: 0)
            )
            themeCellsModel.append(themeCell)
        }
        
        return themeCellsModel
    }
}
