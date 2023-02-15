//
//  OnboardingService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

import UIKit

protocol OnboardingServiceProtocol {
    
    func getOnboardingData() -> [OnboardingCellDataModel]
}

final class OnboardingService: OnboardingServiceProtocol {
    
    func getOnboardingData() -> [OnboardingCellDataModel] {
        let data = [
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: "onboarding_module_title1"~,
                subtitle: "onboarding_module_subtitle1"~
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding2")!,
                title: "onboarding_module_title2"~,
                subtitle: "onboarding_module_subtitle2"~
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding3")!,
                title: "onboarding_module_title3"~,
                subtitle: "onboarding_module_subtitle3"~
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: "onboarding_module_title4"~,
                subtitle: "onboarding_module_subtitle4"~
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title:"onboarding_module_title5"~,
                subtitle: "onboarding_module_subtitle5"~
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: "onboarding_module_title6"~,
                subtitle: "onboarding_module_subtitle6"~
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: "onboarding_module_title7"~,
                subtitle: "onboarding_module_subtitle7"~
            )
        ]
        
        return data
    }
}
