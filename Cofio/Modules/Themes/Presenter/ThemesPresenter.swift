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
    private let themesDataFactory: ThemesDataFactoryProtocol
    
    
    // MARK: Public properties
    
    weak var view: ThemesViewInput?
    weak var output: ThemesPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: ThemesInteractorInput,
         themesDataFactory: ThemesDataFactoryProtocol) {
        self.interactor = interactor
        self.themesDataFactory = themesDataFactory
    }
    
    // MARK: Private
    
    private func updateView() {
        let header = interactor.getCollectionName()
        
        var themesDict: [Theme: Int] = [:]
        for theme in interactor.getThemes() {
            themesDict[theme] = interactor.getCardsCount(themeName: theme.name ?? "")
        }
        let data = themesDataFactory.dataFromThemes(themesDict: themesDict)
        
        view?.updateData(with: data)
        view?.setupNavBarTitle(with: header)
    }
}


// MARK: - CollectionsViewOutput

extension ThemesPresenter: ThemesViewOutput {
    
    func viewDidLoad() {
        updateView()
    }
    
    func viewDidTapRow(_ item: ThemesCellDataModel) {
        output?.moduleWantsToOpenCards(self, themeName: item.title)
    }
    
    func createTheme(name: String) {
        interactor.createTheme(themeName: name)
    }
    
    func refreshView() {
        updateView()
    }
}


// MARK: - CollectionsPresenterInput

extension ThemesPresenter: ThemesPresenterInput {}


// MARK: - CollectionsInteractorOutput

extension ThemesPresenter: ThemesInteractorOutput {}
