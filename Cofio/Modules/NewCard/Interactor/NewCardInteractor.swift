//
//  NewCardInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class NewCardInteractor {
    
    // MARK: Properties
    
    weak var output: NewCardInteractorOutput?
}


// MARK: - WordInteractorInput

extension NewCardInteractor: NewCardInteractorInput {}
