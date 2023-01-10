//
//  SettingsCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.01.2023.
//

enum SettingsCellsDataModel: Hashable {
    case learning(LearningCellDataModel)
    case onboarding(OnboardingCellDataModel)
}

struct LearningCellDataModel: Hashable {
    let title: String
}

struct OnboardingCellDataModel: Hashable {
    let title: String
}
