//
//  FinishRepetitionOfferPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

final class FinishRepetitionOfferPresenter {
    
    // MARK: Private properties
    
    private let themeName: String
    private let repeatDate: String
    private let isCompleted: Bool
    
    // MARK: Public properties
    
    weak var output: FinishRepetitionOfferPresenterOutput?
    weak var view: FinishRepetitionOfferViewInput?
    
    init(themeName: String, repeatDate: String, isCompleted: Bool) {
        self.themeName = themeName
        self.repeatDate = repeatDate
        self.isCompleted = isCompleted
    }
}


extension FinishRepetitionOfferPresenter: FinishRepetitionOfferViewOutput {
    
    func viewDidLoad() {
        let model = FinishRepetitionOfferModel(themeName: themeName, date: repeatDate, isCompleted: isCompleted)
        view?.updateData(with: model)
    }
    
    func close() {
        output?.moduleWantsToClose(self)
    }
}


extension FinishRepetitionOfferPresenter: FinishRepetitionOfferPresenterInput {}
