//
//  ChooseIconPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

final class ChooseIconPresenter {
    
    // MARK: Private properties
    
    private let imageProvider: ImageProviderProtocol
    
    // MARK: Public properties
    
    weak var view: ChooseIconViewInput?
    weak var output: ChooseIconPresenterOutput?
    
    // MARK: Lifecycle
    
    init(imageProvider: ImageProviderProtocol) {
        self.imageProvider = imageProvider
    }
}

// MARK: - ChooseIconViewOutput

extension ChooseIconPresenter: ChooseIconViewOutput {

    func viewDidTapRow(icon: String) {
        output?.moduleWantsToChooseIconAndClose(self, icon: icon)
    }
    
    func getIcons() -> [String] {
        imageProvider.getIcons()
    }
}

// MARK: - ChooseIconPresenterInput

extension ChooseIconPresenter: ChooseIconPresenterInput {}

