//
//  WordPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

protocol WordPresenterInput: AnyObject {}

protocol WordPresenterOutput: AnyObject {
    
    func moduleWantsToClose(_ module: WordPresenterInput)
}
