//
//  FinishRepetitionOfferViewControllerProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

protocol FinishRepetitionOfferViewInput: AnyObject {
    
    func updateData(with data: FinishRepetitionOfferModel)
}

protocol FinishRepetitionOfferViewOutput: AnyObject {
    
    func viewDidLoad()
    func close()
}
