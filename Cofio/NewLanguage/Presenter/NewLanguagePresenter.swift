//
//  NewLanguagePresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewLanguagePresenter {
    
    private let interactor: NewLanguageInteractorInput
    
    weak var view: NewLanguageViewInput?
    weak var output: NewLanguagePresenterOutput?
    
    init(interactor: NewLanguageInteractorInput) {
        self.interactor = interactor
    }
}

extension NewLanguagePresenter: NewLanguageViewOutput {}

extension NewLanguagePresenter: NewLanguagePresenterInput {}

extension NewLanguagePresenter: NewLanguageInteractorOutput {}
