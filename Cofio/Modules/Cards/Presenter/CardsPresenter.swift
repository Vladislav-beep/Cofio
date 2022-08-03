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
        
        var models: [CardCellDataModel] = [
            .init(meaning: "Dog", translation: "Собака"),
            .init(meaning: "Aggregation", translation: "Агрегат"),
            .init(meaning: "sgrbgsv dsvss sdvsd advadv svsvsv svvddsvsvd", translation: "sbvsdv"),
            .init(meaning: "favdvavda", translation: "avdavdvadva"),
            .init(meaning: "davadvad", translation: "svdvsvs"),
            .init(meaning: "svsvvsvs", translation: "vavsd")
        ]
        
        view?.updateData(with: models)
    }
}

extension CardsPresenter: CardsPresenterInput {}

extension CardsPresenter: CardsInteractorOutput {}

