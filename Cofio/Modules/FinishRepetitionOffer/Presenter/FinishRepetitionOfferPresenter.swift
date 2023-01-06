//
//  FinishRepetitionOfferPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

final class FinishRepetitionOfferPresenter {
    
    // MARK: Public properties
    
    weak var output: FinishRepetitionOfferPresenterOutput?
    weak var view: FinishRepetitionOfferViewInput?
    
}


extension FinishRepetitionOfferPresenter: FinishRepetitionOfferViewOutput {
    
    func viewDidLoad() {
        
    }
    
    func close() {
        output?.moduleWantsToClose(self)
    }
}


extension FinishRepetitionOfferPresenter: FinishRepetitionOfferPresenterInput {}
