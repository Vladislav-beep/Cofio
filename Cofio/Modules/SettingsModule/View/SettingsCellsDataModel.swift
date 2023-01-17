//
//  SettingsCellsDataModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.01.2023.
//

enum SettingsCellsDataModel: Hashable {
    case learning(LearningSettingsCellDataModel)
    case onboarding(OnboardingSettingsCellDataModel)
    case deleteAllData(DeleteAllDataCellDataModel)
}

struct LearningSettingsCellDataModel: Hashable {
    let title: String
    let isImageShown: Bool
}

struct OnboardingSettingsCellDataModel: Hashable {
    let title: String
    let isImageShown: Bool
}

struct DeleteAllDataCellDataModel: Hashable {
    let title: String
    let isImageShown: Bool
}
