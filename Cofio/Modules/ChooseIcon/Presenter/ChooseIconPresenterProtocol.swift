//
//  ChooseIconPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

protocol ChooseIconPresenterInput: AnyObject {}

protocol ChooseIconPresenterOutput: AnyObject {
    
    func moduleWantsToChooseIconAndClose(_ module: ChooseIconPresenterInput, icon: String)
}
