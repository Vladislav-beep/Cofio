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
    private var iconName: String?
    
    // MARK: Public properties
    
    weak var view: NewCollectionViewInput?
    weak var output: NewCollectionPresenterOutput?
    
    // MARK: Lifecycle
    
    init(interactor: NewCollectionInteractorInput,
         isEditing: Bool) {
        self.interactor = interactor
        self.isEditing = isEditing
    }
}


// MARK: - NewLanguageViewOutput

extension NewCollectionPresenter: NewCollectionViewOutput {
    
    func moduleDidLoad() {
        output?.moduleDidLoad(self)
        
        if isEditing {
            view?.updateTitleAndButton(title: "new_collection_module_edit_title"~,
                                       buttonTitle: "new_collection_module_button_edit_title"~)
            let collection = interactor.getCollection()
            view?.updateTextViewAndIcon(text: collection.name ?? "", icon: collection.icon ?? "")
        } else {
            view?.updateTitleAndButton(title: "new_collection_module_title"~,
                                       buttonTitle: "new_collection_module_button_title"~)
        }
        
        
    }
    
    func viewDidTapButton(name: String) {
        if isEditing {
            let collection = interactor.getCollection()
            interactor.updateCollection(name: collection.name ?? "", newName: name, icon: iconName ?? "")
        } else {
            let icon = iconName ?? ""
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


// MARK: - NewLanguagePresenterInput

extension NewCollectionPresenter: NewCollectionPresenterInput {
    
    func refreshImageView(icon: String) {
        iconName = icon
        view?.refreshImageView(icon: icon)
    }
}


// MARK: - NewLanguageInteractorOutput

extension NewCollectionPresenter: NewCollectionInteractorOutput {}
