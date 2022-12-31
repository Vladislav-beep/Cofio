//
//  MainPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class MainPresenter {
    
    // MARK: Private properties
    
    private let interactor: MainInteractorInput
    private let collectionsDataFactory: CollectionsDataFactoryProtocol
    
    
    // MARK: Public properties
    
    weak var view: MainViewInput?
    var output: MainPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: MainInteractorInput,
         collectionsDataFactory: CollectionsDataFactoryProtocol) {
        self.interactor = interactor
        self.collectionsDataFactory = collectionsDataFactory
    }
    
    private func updateView() {
        var collectionsDict: [Collection: Int] = [:]
        for collection in interactor.getCollectionsFromStorage() {
            collectionsDict[collection] = interactor.getThemesCountForCollection(collectionName: collection.name ?? "")
        }
        let data = collectionsDataFactory.dataFromCollections(collectionsDict: collectionsDict)
        
        view?.updateView(with: data)
    }
}


// MARK: - StartAppViewOutput

extension MainPresenter: MainViewOutput {
    
    func viewDidLoad() {
        output?.moduleDidLoad(self)
        
        updateView()
    }
    
    func viewDidTapRow(_ type: MainModuleCellsDataModel) {
        switch type {
        case .title, .subtitle:
            break
    
        case .collection(let model):
            output?.moduleWantsToOpenThemes(self, collectionName: model.title)
        }
    }
    
    func addNewCollection() {
        output?.moduleWantsToAddNewCollection(self)
    }
    
    func refreshView() {
        updateView()
    }
}


// MARK: - StartAppPresenterInput

extension MainPresenter: MainPresenterInput {

    func refreshCollections() {
        updateView()
    }
}


// MARK: - StartAppInteractorOutput

extension MainPresenter: MainInteractorOutput {}
