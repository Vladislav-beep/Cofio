//
//  CardsViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol CardsViewInput: AnyObject {
    
    func updateData(with data: [CardsCellsDataModel])
}

protocol CardsViewOutput: AnyObject {
    
    func viewDidLoad()
}
