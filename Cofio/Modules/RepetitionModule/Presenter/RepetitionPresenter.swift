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
    
    // MARK: Private
    
    private func updateView() {
        // TODO: отсеять темы без карточек
        let themes = interactor.fetchAllThemesForRepetition()
        let data = repetitionDataFactory.dataFromThemes(themes: themes)
        view?.updateData(with: data)
    }
}


// MARK: - RepetitionViewOutput

extension RepetitionPresenter: RepetitionViewOutput {
    
    func viewDidLoad() {
        output?.moduleDidLoad(self)
    }
    
    func viewWillAppear() {
        updateView()
    }
    
    func viewDidTapRow(_ item: RepetitionCellDataModel) {
        output?.moduleWantsToOpenCardsRepetition(self, themeName: item.title)
    }
}


// MARK: - RepetitionPresenterInput

extension RepetitionPresenter: RepetitionPresenterInput {
    
    func refreshView() {
        updateView()
    }
}


// MARK: - RepetitionInteractorOutput

extension RepetitionPresenter: RepetitionInteractorOutput {}
