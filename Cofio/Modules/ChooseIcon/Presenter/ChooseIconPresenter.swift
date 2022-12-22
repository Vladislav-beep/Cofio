//
//  ChooseIconPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

final class ChooseIconPresenter {
    
    // MARK: Public properties
    
    weak var view: ChooseIconViewInput?
    weak var output: ChooseIconPresenterOutput?
    
    init() {}
}


// MARK: - ChooseIconViewOutput

extension ChooseIconPresenter: ChooseIconViewOutput {

    func chooseIcon() {
        output?.moduleWantsToChooseIcon(self)
    }
    
    func closeModule() {
        output?.moduleWantsToClose(self)
    }
}


// MARK: - ChooseIconPresenterInput

extension ChooseIconPresenter: ChooseIconPresenterInput {}

