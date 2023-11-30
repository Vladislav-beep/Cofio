//
//  CardsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

final class CardsPresenter {
    
    // MARK: Private properties
    
    private let interactor: CardsInteractorInput
    private let cardsDataFactory: CardsDataFactoryProtocol
    
    // MARK: Public properties
    
    weak var view: CardsViewInput?
    weak var output: CardsPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        interactor: CardsInteractorInput,
        cardsDataFactory: CardsDataFactoryProtocol
    ) {
        self.interactor = interactor
        self.cardsDataFactory = cardsDataFactory
    }
    
    // MARK: Private
    
    private func updateView() {
        let cards = interactor.getCardsFromStorage()
        let data = cardsDataFactory.dataFromCards(cards: cards)
        
        view?.updateData(with: data)
    }
}

// MARK: - CardsViewOutput

extension CardsPresenter: CardsViewOutput {
    
    func viewDidTapRow(_ item: CardCellsDataModel) {
        switch item {
        case .card(let card):
            output?.moduleWantsToOpenCardDetails(self, card: card)
            
        case .empty:
            break
        }
    }
    
    func viewDidLoad() {
        output?.moduleDidLoad(self)
        
        updateView()
    }
    
    func addCard() {
        let themeName = interactor.getThemeName()
        output?.moduleWantsToOpenNewCard(self, themeName: themeName, cardName: nil, isEditing: false)
    }
    
    func refreshView() {
        updateView()
    }
    
    func deleteCard(cardName: String) {
        interactor.deleteCard(cardName: cardName)
        output?.moduleDidDeleteCardCard(self)
    }
    
    func editCard(card: CardCellDataModel) {
        let themeName = interactor.getThemeName()
        output?.moduleWantsToOpenNewCard(self, themeName: themeName, cardName: card.definition, isEditing: true)
    }
}

// MARK: - CardsPresenterInput

extension CardsPresenter: CardsPresenterInput {
    
    func refreshModule() {
        updateView()
    }
}

// MARK: - CardsInteractorOutput

extension CardsPresenter: CardsInteractorOutput {}
