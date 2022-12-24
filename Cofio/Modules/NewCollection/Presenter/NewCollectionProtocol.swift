//
//  NewCollectionProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol NewCollectionPresenterInput: AnyObject {
    
    func refreshImageView(icon: String)
}

protocol NewCollectionPresenterOutput: AnyObject {
    
    func moduleDidLoad(_ module: NewCollectionPresenterInput)
    func moduleWantsToClose(_ module: NewCollectionPresenterInput)
    func moduleWantsToChooseIcon(_ module: NewCollectionPresenterInput)
    func moduleWantsToAddCollectionAndClose(_ module: NewCollectionPresenterInput)
}
