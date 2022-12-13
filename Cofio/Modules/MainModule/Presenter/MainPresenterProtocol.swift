//
//  MainPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol MainPresenterInput: AnyObject {}

protocol MainPresenterOutput: AnyObject {
    
    func moduleWantsToAddNewCollection(_ module: MainPresenterInput)
}
