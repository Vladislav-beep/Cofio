//
//  CardsViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

protocol CardsViewInput: AnyObject {
    
    func updateData(with data: [CardCellsDataModel])
}

protocol CardsViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapRow(_ item: CardCellsDataModel)
    func addCard()
}
