//
//  NewCollectionViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol NewCollectionViewInput: AnyObject {
    
    func refreshImageView(icon: String)
}

protocol NewCollectionViewOutput: AnyObject {
    
    func moduleDidLoad()
    func addNewCollection(name: String)
    func chooseIcon()
    func closeModule()
}
