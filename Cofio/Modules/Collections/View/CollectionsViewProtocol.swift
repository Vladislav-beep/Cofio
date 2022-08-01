//
//  CollectionsViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol CollectionsViewInput: AnyObject {
    
    func updateData(with data: [CollectionsCellsDataModel])
}

protocol CollectionsViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapRow(_ item: CollectionsCellDataModel)
    func viewDidTapClose()
}
