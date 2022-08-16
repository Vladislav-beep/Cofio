//
//  RepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

final class RepetitionPresenter {
    
    private let interactor: RepetitionInteractorInput
    
    weak var view: RepetitionViewInput?
    weak var output: RepetitionPresenterOutput?
    
    init(interactor: RepetitionInteractorInput) {
        self.interactor = interactor
    }
}

extension RepetitionPresenter: RepetitionViewOutput {}

extension RepetitionPresenter: RepetitionPresenterInput {}

extension RepetitionPresenter: RepetitionInteractorOutput {}
