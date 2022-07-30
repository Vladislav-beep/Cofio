//
//  NewLanguageInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewLanguageInteractor {
    
    // MARK: Properties
    
    weak var output: NewLanguageInteractorOutput?
}


// MARK: - NewLanguageInteractorInput

extension NewLanguageInteractor: NewLanguageInteractorInput {}
