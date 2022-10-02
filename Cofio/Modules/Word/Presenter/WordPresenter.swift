//
//  WordPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class WordPresenter {
    
    // MARK: Private properties
    
    private let interactor: WordInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: WordViewInput?
    weak var output: WordPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: WordInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - WordViewOutput

extension WordPresenter: WordViewOutput {
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - WordPresenterInput

extension WordPresenter: WordPresenterInput {}


// MARK: - WordInteractorOutput

extension WordPresenter: WordInteractorOutput {}
