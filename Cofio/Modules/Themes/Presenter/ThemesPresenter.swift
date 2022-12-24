//
//  ThemesPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//
import UIKit

final class ThemesPresenter {
    
    // MARK: Private properties
    
    private let interactor: ThemesInteractorInput
    private let navigationBarTitle: String
    
    
    // MARK: Public properties
    
    weak var view: ThemesViewInput?
    weak var output: ThemesPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: ThemesInteractorInput,
         navigationBarTitle: String) {
        self.interactor = interactor
        self.navigationBarTitle = navigationBarTitle
    }

}


// MARK: - CollectionsViewOutput

extension ThemesPresenter: ThemesViewOutput {
    
    func viewDidLoad() {
        let data = DymmyData.getCollectionCells()
        view?.updateData(with: data)
        view?.setupNavBarTitle(with: navigationBarTitle)
    }
    
    func viewDidTapRow(_ item: ThemesCellDataModel) {
        output?.moduleWantsToOpenCards(self)
    }
    
    func addTheme(name: String) {
        // TODO: add to core data
       // view?.updateData(with: [])
    }
}


// MARK: - CollectionsPresenterInput

extension ThemesPresenter: ThemesPresenterInput {}


// MARK: - CollectionsInteractorOutput

extension ThemesPresenter: ThemesInteractorOutput {}
