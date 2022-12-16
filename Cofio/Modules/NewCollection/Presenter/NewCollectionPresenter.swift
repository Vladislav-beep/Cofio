//
//  NewCollectionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewCollectionPresenter {
    
    // MARK: Private properties
    
    private let interactor: NewCollectionInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: NewCollectionViewInput?
    weak var output: NewCollectionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: NewCollectionInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - NewLanguageViewOutput

extension NewCollectionPresenter: NewCollectionViewOutput {

    func addNewCollection() {
        output?.moduleWantsToAddCollectionAndClose(self)
    }
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - NewLanguagePresenterInput

extension NewCollectionPresenter: NewCollectionPresenterInput {}


// MARK: - NewLanguageInteractorOutput

extension NewCollectionPresenter: NewCollectionInteractorOutput {}
