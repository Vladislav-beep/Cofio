//
//  CardsRepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

final class CardsRepetitionPresenter {
    
    // MARK: Private properties
    
    private let interactor: CardsRepetitionInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: CardsRepetitionViewInput?
    weak var output: CardsRepetitionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: CardsRepetitionInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - CardsRepetitionViewOutput

extension CardsRepetitionPresenter: CardsRepetitionViewOutput {

}


// MARK: - CardsRepetitionPresenterInput

extension CardsRepetitionPresenter: CardsRepetitionPresenterInput {}


// MARK: - CardsRepetitionInteractorOutput

extension CardsRepetitionPresenter: CardsRepetitionInteractorOutput {}
