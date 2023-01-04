//
//  CardsRepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

final class CardsRepetitionPresenter {
    
    // MARK: Private properties
    
    private let interactor: CardsRepetitionInteractorInput
    private let cardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol
    
    
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

    func viewDidLoad() {
        let cards = interactor.fetchCards()
        let themeName = interactor.getThemeName()
        let data = cardsRepetitionDataFactory.dataFromRepetitionCards(cards: cards)
        
//        var cells: [CardCellsDataModel] = []
//        
//        for card in cards {
//            let cell = CardCellsDataModel.card(.init(definition: card.cardDefinition ?? "", description: card.cardDescription ?? ""))
//            cells.append(cell)
//        }
        
        view?.updateData(with: data)
        view?.updateNavBarTitle(navBarTitle: themeName)
    }
}


// MARK: - CardsRepetitionPresenterInput

extension CardsRepetitionPresenter: CardsRepetitionPresenterInput {}


// MARK: - CardsRepetitionInteractorOutput

extension CardsRepetitionPresenter: CardsRepetitionInteractorOutput {}
