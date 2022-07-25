//
//  LanguagesPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import Foundation


final class LanguagesPresenter {
    
    private let interactor: LanguagesInteractorInput
    
    weak var view: LanguagesViewInput?
    weak var output: LanguagesPresenterOutput?
    
    init(interactor: LanguagesInteractorInput) {
        self.interactor = interactor
    }
}

extension LanguagesPresenter: LanguagesViewOutput {}

extension LanguagesPresenter: LanguagesInteractorOutput {}
