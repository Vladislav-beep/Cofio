//
//  SettingsCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.01.2023.
//

enum SettingsCellsDataModel: Hashable {
    case learning(LearningSettingsCellDataModel)
    case onboarding(OnboardingSettingsCellDataModel)
}

struct LearningSettingsCellDataModel: Hashable {
    let title: String
}

struct OnboardingSettingsCellDataModel: Hashable {
    let title: String
}
