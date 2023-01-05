//
//  RepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

final class RepetitionPresenter {
    
    // MARK: Private properties
    
    private let interactor: RepetitionInteractorInput
    private let repetitionDataFactory: RepetitionDataFactoryProtocol
    
    
    // MARK: Public properties
    
    weak var view: RepetitionViewInput?
    var output: RepetitionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: RepetitionInteractorInput,
         repetitionDataFactory: RepetitionDataFactoryProtocol) {
        self.interactor = interactor
        self.repetitionDataFactory = repetitionDataFactory
    }
}


// MARK: - RepetitionViewOutput

extension RepetitionPresenter: RepetitionViewOutput {
    
    func viewWillAppear() {
        let themes = interactor.fetchAllThemesForRepetition()
        let data = repetitionDataFactory.dataFromThemes(themes: themes)
        view?.updateData(with: data)
    }
    
    func viewDidTapRow(_ item: RepetitionCellDataModel) {
        output?.moduleWantsToOpenCardsRepetition(self, themeName: item.title)
    }
}


// MARK: - RepetitionPresenterInput

extension RepetitionPresenter: RepetitionPresenterInput {}


// MARK: - RepetitionInteractorOutput

extension RepetitionPresenter: RepetitionInteractorOutput {}
