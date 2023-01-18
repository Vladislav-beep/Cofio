//
//  MainViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol MainViewInput: AnyObject {
    
    func updateView(with data: [MainModuleCellsDataModel])
}

protocol MainViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapRow(_ type: MainModuleCellsDataModel)
    func viewDidTapButton()
    func editCollection(collectionName: String)
    func refreshView()
    func deleteCollection(collectionName: String)
    func startLearnCollection(collectionName: String)
}
