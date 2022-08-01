//
//  CollectionsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

final class CollectionsPresenter {
    
    private let interactor: CollectionsInteractorInput
    
    weak var view: CollectionsViewInput?
    weak var output: CollectionsPresenterOutput?
    
    init(interactor: CollectionsInteractorInput) {
        self.interactor = interactor
    }
}

extension CollectionsPresenter: CollectionsViewOutput {
    
    func viewDidTapClose() {
        output?.moduleWantsToClose(self)
    }
    
    func viewDidTapRow(_ item: CollectionsCellDataModel) {
        output?.moduleWantsToOpenCards(self)
    }
    
    
    func viewDidLoad() {
        var models: [CollectionsCellsDataModel] = [
            .statics(.init(title: "LOL")),
            .card(.init(title: "Кухня", cardsCount: 2, repeats: 0)),
            .card(.init(title: "Автомобиль", cardsCount: 5, repeats: 5)),
            .card(.init(title: "Домашние дела", cardsCount: 1, repeats: 1)),
            .card(.init(title: "Путешествия", cardsCount: 0, repeats: 7))
        ]
        view?.updateData(with: models)
    }
}

extension CollectionsPresenter: CollectionsPresenterInput {}

extension CollectionsPresenter: CollectionsInteractorOutput {}

