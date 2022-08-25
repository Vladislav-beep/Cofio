//
//  CardsRepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

final class CardsRepetitionPresenter {
    
    private let interactor: CardsRepetitionInteractorInput
    
    weak var view: CardsRepetitionViewInput?
    weak var output: CardsRepetitionPresenterOutput?
    
    init(interactor: CardsRepetitionInteractorInput) {
        self.interactor = interactor
    }
}

extension CardsRepetitionPresenter: CardsRepetitionViewOutput {

}

extension CardsRepetitionPresenter: CardsRepetitionPresenterInput {}

extension CardsRepetitionPresenter: CardsRepetitionInteractorOutput {}
