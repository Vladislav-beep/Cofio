//
//  RepetitionPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

protocol RepetitionPresenterInput: AnyObject {
    
    func refreshView()
}

protocol RepetitionPresenterOutput: AnyObject {
    
    func moduleDidLoad(_ module: RepetitionPresenterInput)
    func moduleWantsToOpenCardsRepetition(_ module: RepetitionPresenterInput, themeName: String)
}
