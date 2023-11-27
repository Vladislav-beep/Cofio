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
                title: Strings.OnboardingModule.title1,
                subtitle: Strings.OnboardingModule.subtitle1
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding2")!,
                title: Strings.OnboardingModule.title2,
                subtitle: Strings.OnboardingModule.subtitle2
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding3")!,
                title: Strings.OnboardingModule.title3,
                subtitle: Strings.OnboardingModule.subtitle3
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: Strings.OnboardingModule.title4,
                subtitle: Strings.OnboardingModule.subtitle4
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: Strings.OnboardingModule.title5,
                subtitle: Strings.OnboardingModule.subtitle5
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: Strings.OnboardingModule.title6,
                subtitle: Strings.OnboardingModule.subtitle6
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: Strings.OnboardingModule.title7,
                subtitle: Strings.OnboardingModule.subtitle7
            )
        ]
        
        return data
    }
}
