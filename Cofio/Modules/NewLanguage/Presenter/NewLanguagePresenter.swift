//
//  NewLanguagePresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewLanguagePresenter {
    
    // MARK: Private properties
    
    private let interactor: NewLanguageInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: NewLanguageViewInput?
    weak var output: NewLanguagePresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: NewLanguageInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - NewLanguageViewOutput

extension NewLanguagePresenter: NewLanguageViewOutput {
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - NewLanguagePresenterInput

extension NewLanguagePresenter: NewLanguagePresenterInput {}


// MARK: - NewLanguageInteractorOutput

extension NewLanguagePresenter: NewLanguageInteractorOutput {}
