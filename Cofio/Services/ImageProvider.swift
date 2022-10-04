//
//  ImageProvider.swift
//  Cofio
//
//  Created by Владислав Сизонов on 28.07.2022.
//

import Foundation
import UIKit

protocol ImageProviderProtocol {
    func getPickerModels() -> [InfoPickerModel]
}

final class ImageProvider: ImageProviderProtocol {
    
    let info = [
        "Английский": UIImage(named: "England") ?? UIImage(),
        "Немецкий": UIImage(named: "Germany") ?? UIImage(),
        "Французский": UIImage(named: "France") ?? UIImage(),
        "Итальянский": UIImage(named: "Italy") ?? UIImage(),
        "Испанский": UIImage(named: "Spain") ?? UIImage(),
        "Русский": UIImage(named: "Russia") ?? UIImage(),
        "Китайский": UIImage(named: "China") ?? UIImage(),
        "Корейский": UIImage(named: "Korea") ?? UIImage(),
        "Турецкий": UIImage(named: "Turkey") ?? UIImage(),
        "Арабский": UIImage(named: "Emirates") ?? UIImage(),
        "Норвежский": UIImage(named: "Norway") ?? UIImage(),
        "Финский": UIImage(named: "Finland") ?? UIImage(),
        "Чешский": UIImage(named: "Czech") ?? UIImage(),
        "Венгерский": UIImage(named: "Hungary") ?? UIImage(),
        "Хинди": UIImage(named: "India") ?? UIImage(),
        "Японский": UIImage(named: "Japan") ?? UIImage(),
        "Португальский": UIImage(named: "Portugal") ?? UIImage(),
        "Украинский": UIImage(named: "Ukraine") ?? UIImage(),
        "Датский": UIImage(named: "Denmark") ?? UIImage(),
        "Шведский": UIImage(named: "Sweden") ?? UIImage(),
        "Ирландский": UIImage(named: "Ireland") ?? UIImage()
    ]
    
    
    func getPickerModels() -> [InfoPickerModel] {
        var models: [InfoPickerModel] = []
        for (language, icon) in info {
            models.append(.init(title: language, icon: icon))
        }
        models.sort()
        return models
    }
    
    func configureLanguageCell(with title: String) -> UIImage {
        return info[title] ?? UIImage()
    }
}
