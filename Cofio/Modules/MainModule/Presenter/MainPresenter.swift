//
//  MainPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import NotificationBannerSwift
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
                title: Strings.MainModule.LearningMethodAlert.title,
                message: Strings.MainModule.LearningMethodAlert.message,
                actionTitle: Strings.MainModule.LearningMethodAlertButton.title,
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
        let title: String
        let message: String
        let image: String
        let style: BannerStyle
        
        if interactor.getThemesCountForCollection(collectionName: collectionName) == 0 ||
           !interactor.allThemesHaveCards(collectionName: collectionName) {
            
            title = Strings.Common.error
            message = Strings.MainModule.RepeatNoThemesToast.message
            image = Assets.noThemesToast.name
            style = .danger
        } else {
            title = Strings.Common.success
            message = Strings.MainModule.RepeatStartedToast.title
            image = Assets.repeatToast.name
            style = .success
            interactor.startLearnCollection(collectionName: collectionName)
        }
        notificationService.showToast(
            title: title,
            message: message,
            style: style,
            image: image
        )
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
