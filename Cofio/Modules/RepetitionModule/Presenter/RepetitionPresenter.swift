//
//  RepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

final class RepetitionPresenter {
    
    // MARK: Private properties
    
    private let interactor: RepetitionInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: RepetitionViewInput?
    weak var output: RepetitionPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: RepetitionInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - RepetitionViewOutput

extension RepetitionPresenter: RepetitionViewOutput {
    
    func viewDidLoad() {
        var data = DymmyData.getRepetitionCellDataModel()
        data.sort { $0.date < $1.date }
        view?.updateData(with: data)
    }
}


// MARK: - RepetitionPresenterInput

extension RepetitionPresenter: RepetitionPresenterInput {}


// MARK: - RepetitionInteractorOutput

extension RepetitionPresenter: RepetitionInteractorOutput {}
