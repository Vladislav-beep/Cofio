//
//  CardsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

final class CardsPresenter {
    
    private let interactor: CardsInteractorInput
    
    weak var view: CardsViewInput?
    weak var output: CardsPresenterOutput?
    
    init(interactor: CardsInteractorInput) {
        self.interactor = interactor
    }
}

extension CardsPresenter: CardsViewOutput {}

extension CardsPresenter: CardsPresenterInput {}

extension CardsPresenter: CardsInteractorOutput {}

