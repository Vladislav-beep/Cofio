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
    weak var output: MainPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: MainInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - StartAppViewOutput

extension MainPresenter: MainViewOutput {
    
    func viewDidLoad() {
        let data = DymmyData.getLanguages()
        
        view?.updateView(with: data)
    }
    
    func viewDidTapRow(_ type: MainModuleCellViewModel) {
        output?.moduleWantsToOpenTabbar(self)
    }
    
    func addNewLanguage() {
        output?.moduleWantsToAddNewLanguage(self)
    }
}


// MARK: - StartAppPresenterInput

extension MainPresenter: MainPresenterInput {}


// MARK: - StartAppInteractorOutput

extension MainPresenter: MainInteractorOutput {}
