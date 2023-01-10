//
//  SettingsViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 09.01.2023.
//

protocol SettingsViewInput: AnyObject {
    
    func updateData(with data: [SettingsCellsDataModel])
}

protocol SettingsViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapLearningCell()
    func viewDidTapOnboardingCell()
}
