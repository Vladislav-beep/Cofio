//
//  ThemesPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

final class ThemesPresenter {
    
    // MARK: Private properties
    
    private let interactor: ThemesInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: ThemesViewInput?
    weak var output: ThemesPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: ThemesInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - CollectionsViewOutput

extension ThemesPresenter: ThemesViewOutput {
    
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
    
    func viewDidTapRow(_ item: ThemesCellDataModel) {
        output?.moduleWantsToOpenCards(self)
    }
}


// MARK: - CollectionsPresenterInput

extension ThemesPresenter: ThemesPresenterInput {}


// MARK: - CollectionsInteractorOutput

extension ThemesPresenter: ThemesInteractorOutput {}

