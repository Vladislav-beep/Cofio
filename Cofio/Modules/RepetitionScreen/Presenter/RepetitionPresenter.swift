//
//  RepetitionPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

final class RepetitionPresenter {
    
    private let interactor: RepetitionInteractorInput
    
    weak var view: RepetitionViewInput?
    weak var output: RepetitionPresenterOutput?
    
    init(interactor: RepetitionInteractorInput) {
        self.interactor = interactor
    }
}

extension RepetitionPresenter: RepetitionViewOutput {
    
    func viewDidLoad() {
        var data = DymmyData.getRepetitionCellDataModel()
        data.sort { $0.repeatDate < $1.repeatDate }
        view?.updateData(with: data)
    }
}

extension RepetitionPresenter: RepetitionPresenterInput {}

extension RepetitionPresenter: RepetitionInteractorOutput {}
