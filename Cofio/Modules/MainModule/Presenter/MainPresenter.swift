//
//  MainPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class MainPresenter {
    
    // MARK: Private properties
    
    private let interactor: MainInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: MainViewInput?
    var output: MainPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: MainInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - StartAppViewOutput

extension MainPresenter: MainViewOutput {
    
    func viewDidLoad() {
        output?.moduleDidLoad(self)
        
        let data = DymmyData.getLanguages()
        view?.updateView(with: data)
    }
    
    func viewDidTapRow(_ type: MainModuleCellsDataModel) {
        switch type {
        case .title:
            break
            
        case .subtitle:
            break
            
        case .collection(let model):
            output?.moduleWantsToOpenThemes(self, title: model.title)
        }
        
    }
    
    func addNewCollection() {
        output?.moduleWantsToAddNewCollection(self)
    }
}


// MARK: - StartAppPresenterInput

extension MainPresenter: MainPresenterInput {

    func refreshCollections() {
        print("vlad refreshCollections")
    }
}


// MARK: - StartAppInteractorOutput

extension MainPresenter: MainInteractorOutput {}
