//
//  NewCollectionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class NewCollectionPresenter {
    
    // MARK: Private properties
    
    private let interactor: NewCollectionInteractorInput
    private let isEditing: Bool
    private var iconName = "iconPlaceholder"
    
    // MARK: Public properties
    
    weak var view: NewCollectionViewInput?
    weak var output: NewCollectionPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        interactor: NewCollectionInteractorInput,
        isEditing: Bool
    ) {
        self.interactor = interactor
        self.isEditing = isEditing
    }
}

// MARK: - NewCollectionViewOutput

extension NewCollectionPresenter: NewCollectionViewOutput {
    
    func moduleDidLoad() {
        output?.moduleDidLoad(self)
        
        if isEditing {
            view?.updateTitleAndButton(
                title: Strings.NewCollectionModule.editTitle,
                buttonTitle: Strings.NewCollectionModule.Button.editTitle
            )
            let collection = interactor.getCollection()
            view?.updateTextViewAndIcon(text: collection.name ?? "", icon: collection.icon ?? "iconPlaceholder")
        } else {
            view?.updateTitleAndButton(
                title: Strings.NewCollectionModule.title,
                buttonTitle: Strings.NewCollectionModule.Button.title
            )
        }
    }
    
    func viewDidTapButton(name: String) {
        if isEditing {
            let collection = interactor.getCollection()
            interactor.updateCollection(name: collection.name ?? "", newName: name, icon: iconName)
        } else {
            // TODO: добавить проверку на сущестование имени коллекции и на пустое имя
            let icon = iconName
            interactor.createCollection(name: name, icon: icon)
        }
        
        output?.moduleWantsToAddCollectionAndClose(self)
    }
    
    func chooseIcon() {
        output?.moduleWantsToChooseIcon(self)
    }
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}

// MARK: - NewCollectionPresenterInput

extension NewCollectionPresenter: NewCollectionPresenterInput {
    
    func refreshImageView(icon: String) {
        iconName = icon
        view?.refreshImageView(icon: icon)
    }
}

// MARK: - NewCollectionInteractorOutput

extension NewCollectionPresenter: NewCollectionInteractorOutput {}
