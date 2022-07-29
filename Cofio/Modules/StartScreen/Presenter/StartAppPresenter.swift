//
//  LanguagesPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import Foundation


final class StartAppPresenter {
    
    private let interactor: StartAppInteractorInput
    
    weak var view: StartAppViewInput?
    weak var output: StartAppPresenterOutput?
    
    init(interactor: StartAppInteractorInput) {
        self.interactor = interactor
    }
}

extension StartAppPresenter: StartAppViewOutput {
    
    func addNewLanguage() {
        output?.moduleWantsToAddNewLanguage(self)
    }
}

extension StartAppPresenter: StartAppPresenterInput {}

extension StartAppPresenter: StartAppInteractorOutput {}
