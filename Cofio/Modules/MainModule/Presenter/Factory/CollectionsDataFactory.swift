//
//  CollectionsDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.12.2022.
//

protocol CollectionsDataFactoryProtocol {
    
    func dataFromCollections(collections: [Collection]) -> [MainModuleCellsDataModel]
}

final class CollectionsDataFactory: CollectionsDataFactoryProtocol {
    
    func dataFromCollections(collections: [Collection]) -> [MainModuleCellsDataModel] {
        var mainCellsModel: [MainModuleCellsDataModel] = [.title(.init(title: "main_module_title"~)),
                                                          .subtitle(.init(subtitle: "main_module_subtitle"~))]
        
        for collection in collections {
            let collectionCell = MainModuleCellsDataModel.collection(.init(title: collection.name ?? "", collectionsCount: 2, image: collection.icon ?? ""))
            mainCellsModel.append(collectionCell)
        }
        
        return mainCellsModel
    }
}
