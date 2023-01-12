//
//  SettingsPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

protocol SettingsPresenterInput: AnyObject {}

protocol SettingsPresenterOutput: AnyObject {

    func moduleWantsToOpenLearningMethod(_ module: SettingsPresenterInput)
    func moduleWantsToOpenOnboarding(_ module: SettingsPresenterInput)
}
