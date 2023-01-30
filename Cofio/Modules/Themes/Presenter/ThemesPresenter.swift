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
    private let userDefaultsService: UserDefaultsServiceProtocol
    private let notificationService: NotificationServiceProtocol
    
    // MARK: Public properties
    
    weak var view: ThemesViewInput?
    weak var output: ThemesPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        interactor: ThemesInteractorInput,
        themesDataFactory: ThemesDataFactoryProtocol,
        userDefaultsService: UserDefaultsServiceProtocol,
        notificationService: NotificationServiceProtocol
    ) {
        self.interactor = interactor
        self.themesDataFactory = themesDataFactory
        self.userDefaultsService = userDefaultsService
        self.notificationService = notificationService
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

// MARK: - ThemesViewOutput

extension ThemesPresenter: ThemesViewOutput {
    
    func viewDidLoad() {
        updateView()
    }
    
    func viewDidTapRow(_ item: ThemesCellDataModel) {
        output?.moduleWantsToOpenCards(self, themeName: item.title)
    }
    
    func createTheme(name: String) {
        let repetitionType: String
        
        if userDefaultsService.getRepetitionType() == .long {
            repetitionType = "long"
        } else {
            repetitionType = "week"
        }
        interactor.createTheme(themeName: name, repetitionType: repetitionType)
    }
    
    func refreshView() {
        updateView()
    }
    
    func deleteTheme(themeName: String) {
        interactor.deleteTheme(themeName: themeName)
    }
    
    func addTheme() {
        notificationService.showTwoButtonAndTextFieldAlert(
            title: "theme_module_alert_title"~,
            message: "theme_module_alert_subtitle"~,
            actionTitle: "theme_module_alert_add_button"~,
            textFieldPlaceholder: "theme_module_alert_textField_placeholder"~,
            textFieldText: nil) { [weak self] name in
                guard let self = self else { return }
                
                // TODO: добавить проверку на сущестование имени темы
                self.createTheme(name: name)
                self.refreshView()
            }
    }
    
    func editTheme(currentName: String) {
        notificationService.showTwoButtonAndTextFieldAlert(
            title: "theme_module_alert_edit_title"~,
            message: "theme_module_alert_edit_subtitle"~,
            actionTitle: "theme_module_alert_edit_button"~,
            textFieldPlaceholder: nil,
            textFieldText: currentName
        ) { [weak self] newName in
            guard let self = self else { return }
            
            self.interactor.editTheme(themeName: currentName, newName: newName)
            self.refreshView()
        }
    }
    
    func startLearningTheme(themeName: String) {
        let title: String
        let icon: String
        
        if interactor.getCardsCount(themeName: themeName) == 0 {
            title = "theme_module_repeat_no_cards_toast_title"~
            icon = "noThemesToast"
        } else {
            title = "theme_module_repeat_started_toast_title"~
            icon = "repeatToast"
            interactor.startLearningTheme(themeName: themeName)
        }
        notificationService.showToast(
            message: title,
            icon: icon
        )
    }
}

// MARK: - ThemesPresenterInput

extension ThemesPresenter: ThemesPresenterInput {}

// MARK: - ThemesInteractorOutput

extension ThemesPresenter: ThemesInteractorOutput {}
