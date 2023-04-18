//
//  UIAssembly.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.04.2023.
//

final class UIAssembly: UIAssemblyProtocol {
    
    var imageProviderService: ImageProviderProtocol {
        ImageProvider()
    }
    
    var onboardingService: OnboardingServiceProtocol {
        OnboardingService()
    }
    
    var notificationService: NotificationServiceProtocol {
        NotificationService()
    }
}
