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
    private let dateFormatterService: DateFormatterServiceProtocol
    private var cardsData: [RepetitionCardCellDataModel] = []
    private var isLastCard: Bool = false
    
    // MARK: Public properties
    
    weak var view: CardsRepetitionViewInput?
    weak var output: CardsRepetitionPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        interactor: CardsRepetitionInteractorInput,
        cardsRepetitionDataFactory: CardsRepetitionDataFactoryProtocol,
        dateFormatterService: DateFormatterServiceProtocol
    ) {
        self.interactor = interactor
        self.cardsRepetitionDataFactory = cardsRepetitionDataFactory
        self.dateFormatterService = dateFormatterService
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
        let card = cardsData[indexPath.item]
        let newCard = RepetitionCardCellDataModel(
            id: UUID(),
            definition: card.definition,
            description: card.description,
            descriptionShown: true
        )
        cardsData.remove(at: indexPath.item)
        cardsData.insert(newCard, at: indexPath.item)
        view?.updateData(with: cardsData)
    }
    
    func viewDidTapButton(indexPath: IndexPath) {
        if isLastCard || cardsData.count == 1 {
            interactor.updateTheme()
            let theme = interactor.fetchTheme()
            if theme.repeats == 7 {
                let themeName = interactor.getThemeName()
                output?.moduleWantsToOpenFinishOffer(
                    self,
                    themeName: themeName,
                    repeatDate: nil,
                    isCompleted: true
                )
                return
            }
            let date = theme.repeatDate ?? Date()
            let dateString = dateFormatterService.dateToString(date: date)
            let themeName = interactor.getThemeName()
            output?.moduleWantsToOpenFinishOffer(self, themeName: themeName, repeatDate: dateString, isCompleted: false)
        }
        
        if indexPath.row == cardsData.count - 1 {
            isLastCard = true
        }
    }
    
    func viewDidTapMoreTime(indexPath: IndexPath) {
        let card = cardsData[indexPath.item]
        let newCard = RepetitionCardCellDataModel(
            id: UUID(),
            definition: card.definition,
            description: card.description,
            descriptionShown: false
        )
        cardsData.append(newCard)
        view?.updateData(with: cardsData)
    }
}

// MARK: - CardsRepetitionPresenterInput

extension CardsRepetitionPresenter: CardsRepetitionPresenterInput {}

// MARK: - CardsRepetitionInteractorOutput

extension CardsRepetitionPresenter: CardsRepetitionInteractorOutput {}
