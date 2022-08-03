//
//  WordPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class WordPresenter {
    
    private let interactor: WordInteractorInput
    
    weak var view: WordViewInput?
    weak var output: WordPresenterOutput?
    
    init(interactor: WordInteractorInput) {
        self.interactor = interactor
    }
}

extension WordPresenter: WordViewOutput {
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}

extension WordPresenter: WordPresenterInput {}

extension WordPresenter: WordInteractorOutput {}
