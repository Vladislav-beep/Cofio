//
//  CollectionsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

final class CollectionsPresenter {
    
    // MARK: Private properties
    
    private let interactor: CollectionsInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: CollectionsViewInput?
    weak var output: CollectionsPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: CollectionsInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - CollectionsViewOutput

extension CollectionsPresenter: CollectionsViewOutput {
    
    func openRepetition() {
        output?.moduleWantsToOpenRepetition(self)
    }
    
    func viewDidLoad() {
        let data = DymmyData.getCollectionCells()
        view?.updateData(with: data)
        view?.setupNavBarTitle(with: "Финский язык")
    }
    
    func viewDidTapClose() {
        output?.moduleWantsToClose(self)
    }
    
    func viewDidTapRow(_ item: CollectionsCellDataModel) {
        output?.moduleWantsToOpenCards(self)
    }
}


// MARK: - CollectionsPresenterInput

extension CollectionsPresenter: CollectionsPresenterInput {}


// MARK: - CollectionsInteractorOutput

extension CollectionsPresenter: CollectionsInteractorOutput {}

