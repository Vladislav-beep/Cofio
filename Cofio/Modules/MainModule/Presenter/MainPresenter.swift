//
//  MainPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class MainPresenter {
    
    // MARK: Private properties
    
    private let interactor: MainInteractorInput
    private let collectionsDataFactory: CollectionsDataFactoryProtocol
    private let notificationService: NotificationServiceProtocol
    
    // MARK: Public properties
    
    weak var view: MainViewInput?
    var output: MainPresenterOutput?
    
    // MARK: Lifecycle
    
    init(
        interactor: MainInteractorInput,
        collectionsDataFactory: CollectionsDataFactoryProtocol,
        notificationService: NotificationServiceProtocol
    ) {
        self.interactor = interactor
        self.collectionsDataFactory = collectionsDataFactory
        self.notificationService = notificationService
    }
    
    // MARK: Private
    
    private func updateView() {
        var collectionsDict: [Collection: Int] = [:]
        for collection in interactor.fetchCollections() {
            collectionsDict[collection] = interactor.getThemesCountForCollection(collectionName: collection.name ?? "")
        }
        let data = collectionsDataFactory.dataFromCollections(collectionsDict: collectionsDict)
        
        view?.updateView(with: data)
    }
}

// MARK: - StartAppViewOutput

extension MainPresenter: MainViewOutput {
    
    func deleteCollection(collectionName: String) {
        interactor.deleteCollection(collectionName: collectionName)
    }
    
    func viewDidLoad() {
        output?.moduleDidLoad(self)
        updateView()
    }
    
    func viewDidTapRow(_ type: MainModuleCellsDataModel) {
        switch type {
        case .subtitle, .empty:
            break
            
        case .collection(let model):
            output?.moduleWantsToOpenThemes(self, collectionName: model.title)
        }
    }
    
    func viewDidTapButton() {
        if interactor.getRepetitionType() == nil {
            // TODO: сделать переход в настройки
            let handler: () -> Void = { [weak self] in
                self?.output?.moduleWantsToOpenSettingsTab()
            }
            notificationService.showOneButtonAlert(
                title: "main_module_learning_method_alert_title"~,
                message: "main_module_learning_method_alert_message"~,
                actionTitle: "main_module_learning_method_alert_button_title"~,
                completion: handler)
        } else {
            output?.moduleWantsToAddNewCollection(self)
        }
    }
    
    func editCollection(collectionName: String) {
        output?.moduleWantsToEditCollection(self, collectionName: collectionName)
    }
    
    func refreshView() {
        updateView()
    }
    
    func startLearnCollection(collectionName: String) {
        interactor.startLearnCollection(collectionName: collectionName)
        notificationService.showToast(message: "main_module_repeat_started_toast_title"~)
    }
}

// MARK: - MainPresenterInput

extension MainPresenter: MainPresenterInput {
    
    func refreshCollections() {
        updateView()
    }
}

// MARK: - MainInteractorOutput

extension MainPresenter: MainInteractorOutput {}
