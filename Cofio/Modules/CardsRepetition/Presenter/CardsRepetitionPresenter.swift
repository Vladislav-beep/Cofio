//
//  CardsRepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import Foundation

final class CardsRepetitionPresenter {
    
    // MARK: Private properties
    
    private let interactor: CardsRepetitionInteractorInput
    private let cardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol
    private var cardsData: [RepetitionCardCellsDataModel] = []
    private var isLastCard: Bool = false
    
    
    // MARK: Public properties
    
    weak var view: CardsRepetitionViewInput?
    weak var output: CardsRepetitionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: CardsRepetitionInteractorInput,
         cardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol) {
        self.interactor = interactor
        self.cardsRepetitionDataFactory = cardsRepetitionDataFactory
    }
}


// MARK: - CardsRepetitionViewOutput

extension CardsRepetitionPresenter: CardsRepetitionViewOutput {
    
    func getCardsCount() -> Int {
        cardsData.count
    }
    
    func viewDidLoad() {
        let cards = interactor.fetchCards()
        let themeName = interactor.getThemeName()
        let data = cardsRepetitionDataFactory.dataFromRepetitionCards(cards: cards)
        cardsData = data
        
        view?.updateData(with: cardsData)
        view?.updateNavBarTitle(navBarTitle: themeName)
    }
    
    func viewDidTapRow(indexPath: IndexPath) {
        switch cardsData[indexPath.item] {
        case .card(let model):
            let newCard = RepetitionCardCellsDataModel.card(.init(definition: model.definition, description: model.description, descriptionShown: true))
            cardsData.remove(at: indexPath.item)
            cardsData.insert(newCard, at: indexPath.item)
            view?.updateData(with: cardsData)
            
        case .empty:
            break
        }
    }
    
    func viewDidTapButton(indexPath: IndexPath) {
        if isLastCard || cardsData.count == 1 {
            output?.moduleWantsToOpenFinishOffer(self)
        }
        
        if indexPath.row == cardsData.count - 1 {
            isLastCard = true
        }
    }
}


// MARK: - CardsRepetitionPresenterInput

extension CardsRepetitionPresenter: CardsRepetitionPresenterInput {}


// MARK: - CardsRepetitionInteractorOutput

extension CardsRepetitionPresenter: CardsRepetitionInteractorOutput {}
