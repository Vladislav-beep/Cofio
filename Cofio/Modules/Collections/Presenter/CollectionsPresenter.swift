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

extension CollectionsPresenter: CollectionsPresenterInput {}

extension CollectionsPresenter: CollectionsInteractorOutput {}

