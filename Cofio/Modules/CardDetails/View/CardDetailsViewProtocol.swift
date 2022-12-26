//
//  CardDetailsViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 17.12.2022.
//

protocol CardDetailsViewInput: AnyObject {
    
    func updateView(model: CardCellDataModel)
}

protocol CardDetailsViewOutput: AnyObject {
    
    func viewDidLoad()
}
