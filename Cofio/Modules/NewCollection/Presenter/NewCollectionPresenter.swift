//
//  NewCollectionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewCollectionPresenter {
    
    // MARK: Private properties
    
    private let interactor: NewCollectionInteractorInput
    private var iconName: String?
    
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
    
    func moduleDidLoad() {
        output?.moduleDidLoad(self)
    }
    
    func addNewCollection(name: String) {
        let icon = iconName ?? ""
        interactor.createCollection(name: name, icon: icon)
        
        output?.moduleWantsToAddCollectionAndClose(self)
    }
    
    func chooseIcon() {
        output?.moduleWantsToChooseIcon(self)
    }
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - NewLanguagePresenterInput

extension NewCollectionPresenter: NewCollectionPresenterInput {
    
    func refreshImageView(icon: String) {
        iconName = icon
        view?.refreshImageView(icon: icon)
    }
}


// MARK: - NewLanguageInteractorOutput

extension NewCollectionPresenter: NewCollectionInteractorOutput {}
