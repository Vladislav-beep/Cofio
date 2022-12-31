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
    
    init(interactor: CardsInteractorInput,
         cardsDataFactory: CardsDataFactoryProtocol) {
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
    
    func viewDidTapRow(_ item: CardCellDataModel) {
        output?.moduleWantsToOpenCardDetails(self, card: item)
    }
    
    func viewDidLoad() {
        output?.moduleDidLoad(self)
        
        updateView()
    }
    
    func addCard() {
        output?.moduleWantsToOpenNewCard(self)
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
