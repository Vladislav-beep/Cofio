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
    
    // MARK: Public properties
    
    weak var output: FinishRepetitionOfferPresenterOutput?
    weak var view: FinishRepetitionOfferViewInput?
    
    init(themeName: String, repeatDate: String) {
        self.themeName = themeName
        self.repeatDate = repeatDate
    }
}


extension FinishRepetitionOfferPresenter: FinishRepetitionOfferViewOutput {
    
    func viewDidLoad() {
        let model = FinishRepetitionOfferModel(themeName: themeName, date: repeatDate)
        view?.updateData(with: model)
    }
    
    func close() {
        output?.moduleWantsToClose(self)
    }
}


extension FinishRepetitionOfferPresenter: FinishRepetitionOfferPresenterInput {}
