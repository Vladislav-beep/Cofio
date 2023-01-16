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
        // TODO: запилить норм данные для онбординга
        let data = [
            OnboardingCellDataModel(
                image: UIImage(named: "book")!,
                title: "11111111",
                subtitle: "ascvassac"
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "clock")!,
                title: "222222222",
                subtitle: "sfffffffffff"
            ),
            OnboardingCellDataModel(
                image: UIImage(named: "onboarding")!,
                title: "qeklqklkm klmqemkelwklmwe wklem eeetehehet tehhteehthte",
                subtitle: "wekwekewkp kwdkkwkwkm kmwekmwkmkm mkekm wekweklkew kmwekmewkmekmlwk mmk kmewmkekmwlwkemlekml kmwekmlewklmew mkwekmle wklmkmlewkmew mkw e"
            )
        ]
        
        return data
    }
}
