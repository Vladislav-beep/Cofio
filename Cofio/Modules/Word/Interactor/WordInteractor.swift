//
//  WordInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class WordInteractor {
    
    // MARK: Properties
    
    weak var output: WordInteractorOutput?
}


// MARK: - WordInteractorInput

extension WordInteractor: WordInteractorInput {}
