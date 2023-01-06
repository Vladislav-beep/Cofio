//
//  FinishRepetitionOfferPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

protocol FinishRepetitionOfferPresenterInput: AnyObject {}

protocol FinishRepetitionOfferPresenterOutput: AnyObject {
    
    func moduleWantsToClose(_ module: FinishRepetitionOfferPresenterInput)
}
