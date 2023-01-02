//
//  RepetitionInteractorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

protocol RepetitionInteractorInput: AnyObject {
    
    func fetchAllThemesForRepetition() -> [Theme]
}

protocol RepetitionInteractorOutput: AnyObject {}
