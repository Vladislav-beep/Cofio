//
//  NewCollectionProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol NewCollectionPresenterInput: AnyObject {}

protocol NewCollectionPresenterOutput: AnyObject {
    
    func moduleWantsToClose(_ module: NewCollectionPresenterInput)
    func moduleWantsToChooseIcon(_ module: NewCollectionPresenterInput)
    func moduleWantsToAddCollectionAndClose(_ module: NewCollectionPresenterInput)
}
