//
//  CardsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

final class CardsPresenter {
    
    // MARK: Private properties
    
    private let interactor: CardsInteractorInput
    
    
    // MARK: Public properties
    
    weak var view: CardsViewInput?
    weak var output: CardsPresenterOutput?
    
    
    // MARK: Lifecycle
    
    init(interactor: CardsInteractorInput) {
        self.interactor = interactor
    }
}


// MARK: - CardsViewOutput

extension CardsPresenter: CardsViewOutput {
    
    func viewDidTapRow(_ item: CardCellDataModel) {
        output?.moduleWantsToOpenCardDetails(self)
    }
    
    func viewDidLoad() {
        let data = DymmyData.getCardCellDataModel()
        view?.updateData(with: data)
    }
}


// MARK: - CardsPresenterInput

extension CardsPresenter: CardsPresenterInput {}


// MARK: - CardsInteractorOutput

extension CardsPresenter: CardsInteractorOutput {}
