//
//  CollectionsPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol CollectionsPresenterInput: AnyObject {}

protocol CollectionsPresenterOutput: AnyObject {
    
    func moduleWantsToOpenCards(_ module: CollectionsPresenterInput)
    func moduleWantsToClose(_ module: CollectionsPresenterInput)
    func moduleWantsToOpenRepetition(_ module: CollectionsPresenterInput)
}

