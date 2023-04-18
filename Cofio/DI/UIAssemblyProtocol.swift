//
//  UIAssemblyProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.04.2023.
//

import Foundation

protocol UIAssemblyProtocol {
    
    var imageProviderService: ImageProviderProtocol { get }
    var onboardingService: OnboardingServiceProtocol { get }
    var notificationService: NotificationServiceProtocol { get }
}
