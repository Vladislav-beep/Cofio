//
//  LanguagesPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class StartAppPresenter {
    
    // MARK: Private properties
    
    private let interactor: StartAppInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: StartAppViewInput?
    weak var output: StartAppPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: StartAppInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - StartAppViewOutput

extension StartAppPresenter: StartAppViewOutput {
    
    func viewDidTapRow(_ type: Language) {
        output?.moduleWantsToOpenTabbar(self)
    }
    
    
    func addNewLanguage() {
        output?.moduleWantsToAddNewLanguage(self)
    }
}


// MARK: - StartAppPresenterInput

extension StartAppPresenter: StartAppPresenterInput {}


// MARK: - StartAppInteractorOutput

extension StartAppPresenter: StartAppInteractorOutput {}
