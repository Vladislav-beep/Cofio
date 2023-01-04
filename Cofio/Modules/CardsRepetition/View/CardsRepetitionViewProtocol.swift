//
//  CardsRepetitionViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

protocol CardsRepetitionViewInput: AnyObject {
    
    func updateData(with data: [CardCellsDataModel])
    func updateNavBarTitle(navBarTitle: String)
}

protocol CardsRepetitionViewOutput: AnyObject {
    
    func viewDidLoad()
}
