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
    
    func viewDidTapRow(_ item: CollectionsCellDataModel) {
        output?.moduleWantsToOpenCards(self)
    }
    
    
    func viewDidLoad() {
        var models: [CollectionsCellsDataModel] = [.statics(.init(title: "LOL")), .card(.init(title: "CACAC", subtitle: "pPPPPP")), .card(.init(title: "mksvkm", subtitle: "aklvj"))]
        view?.updateData(with: models)
    }
}

extension CollectionsPresenter: CollectionsPresenterInput {}

extension CollectionsPresenter: CollectionsInteractorOutput {}

