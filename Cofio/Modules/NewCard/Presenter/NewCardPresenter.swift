//
//  WordPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

final class NewCardPresenter {
    
    // MARK: Private properties
    
    private let interactor: NewCardInteractorInput
    private let isEditing: Bool
    
    // MARK: Public properties
    
    weak var view: NewCardViewInput?
    weak var output: NewCardPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        interactor: NewCardInteractorInput,
        isEditing: Bool
    ) {
        self.interactor = interactor
        self.isEditing = isEditing
    }
}

// MARK: - WordViewOutput

extension NewCardPresenter: NewCardViewOutput {
    
    func viewDidLoad() {
        if isEditing {
            let card = interactor.getCard()
            view?.updateData(
                definition: card.cardDefinition ?? "",
                description: card.cardDescription ?? ""
            )
            view?.updateButtonTitle(title: "new_card_module_edit_button_title"~)
        }
    }
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
    
    func didTapButton(definition: String, description: String) {
        if isEditing {
            let cardDefinition = interactor.getCard().cardDefinition ?? ""
            interactor.updateCard(
                cardDefinition: cardDefinition,
                newDefinition: definition,
                newDescription: description
            )
            output?.moduleWantsToAddNewCard(self)
        } else {
            interactor.createCard(definition: definition, description: description)
            output?.moduleWantsToAddNewCard(self)
        }
    }
}

// MARK: - NewCardPresenterInput

extension NewCardPresenter: NewCardPresenterInput {}

// MARK: - NewCardInteractorOutput

extension NewCardPresenter: NewCardInteractorOutput {}
