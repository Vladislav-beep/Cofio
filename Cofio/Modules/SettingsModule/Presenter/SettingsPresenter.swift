//
//  SettingsPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

final class SettingsPresenter {
    
    // MARK: Public properties
    
    weak var view: SettingsViewInput?
    var output: SettingsPresenterOutput?
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {

}

// MARK: - SettingsPresenterInput

extension SettingsPresenter: SettingsPresenterInput {

}
