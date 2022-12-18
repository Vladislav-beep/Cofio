//
//  WordPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class NewCardPresenter {
    
    // MARK: Private properties
    
    private let interactor: NewCardInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: NewCardViewInput?
    weak var output: NewCardPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: NewCardInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - WordViewOutput

extension NewCardPresenter: NewCardViewOutput {
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - WordPresenterInput

extension NewCardPresenter: NewCardPresenterInput {}


// MARK: - WordInteractorOutput

extension NewCardPresenter: NewCardInteractorOutput {}
