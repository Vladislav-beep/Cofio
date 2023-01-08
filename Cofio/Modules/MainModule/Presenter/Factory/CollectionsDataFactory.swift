//
//  CollectionsDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.12.2022.
//

import UIKit

protocol CollectionsDataFactoryProtocol {
    
    func dataFromCollections(collectionsDict: [Collection: Int]) -> [MainModuleCellsDataModel]
}

final class CollectionsDataFactory: CollectionsDataFactoryProtocol {
    
    // MARK: Public
    
    func dataFromCollections(collectionsDict: [Collection: Int]) -> [MainModuleCellsDataModel] {
        var mainCellsModel: [MainModuleCellsDataModel] = [
            .title(.init(title: "main_module_title"~)),
            .subtitle(.init(subtitle: "main_module_subtitle"~))
        ]
        let keys = collectionsDict.keys.sorted { $0.name ?? "" > $1.name ?? "" }
        
        if keys.isEmpty {
            let emptyCell = MainModuleCellsDataModel.empty(.init(title: "main_module_empty_cell_title"~))
            mainCellsModel.append(emptyCell)
            return mainCellsModel
        }
        
        for collection in keys {
            let collectionCell = MainModuleCellsDataModel.collection(
                .init(
                    title: collection.name ?? "",
                    subtitle: countThemes(count: collectionsDict[collection] ?? 0),
                    image: collection.icon ?? ""
                )
            )
            mainCellsModel.append(collectionCell)
        }
        
        return mainCellsModel
    }
    
    // MARK: Private
    
    private func countThemes(count: Int) -> String {
        let formatString : String = NSLocalizedString("collection themes count",
                                                      comment: "")
        let resultString : String = String.localizedStringWithFormat(formatString, count)
        return resultString
    }
}
