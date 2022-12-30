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
    
    func viewDidLoad() {
        let header = interactor.getCollectionName()
        let themes = interactor.getThemes()
        var models: [ThemesCellsDataModel] = [.statics(.init(title: "")),.header(.init(title: "theme_module_header"~))]
        for theme in themes {
            let model = ThemesCellsDataModel.card(.init(title: theme.name ?? "", subtitle: "afc", totalRepeats: 7, repeats: Int(theme.repeats)))
            models.append(model)
        }
        view?.updateData(with: models)
        view?.setupNavBarTitle(with: header)
    }
    
    func viewDidTapRow(_ item: ThemesCellDataModel) {
        output?.moduleWantsToOpenCards(self)
    }
    
    func createTheme(name: String) {
        interactor.createTheme(themeName: name)
    }
}


// MARK: - CollectionsPresenterInput

extension ThemesPresenter: ThemesPresenterInput {}


// MARK: - CollectionsInteractorOutput

extension ThemesPresenter: ThemesInteractorOutput {}
