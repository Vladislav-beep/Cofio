//
//  CardsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

final class CardsPresenter {
    
    private let interactor: CardsInteractorInput
    
    weak var view: CardsViewInput?
    weak var output: CardsPresenterOutput?
    
    init(interactor: CardsInteractorInput) {
        self.interactor = interactor
    }
}

extension CardsPresenter: CardsViewOutput {
    
    func viewDidTapRow(_ item: CardCellDataModel) {
        output?.moduleWantsToOpenWord(self)
    }
    
    func viewDidLoad() {
        let data = DymmyData.getCardCellDataModel()
        view?.updateData(with: data)
    }
}

extension CardsPresenter: CardsPresenterInput {}

extension CardsPresenter: CardsInteractorOutput {}

