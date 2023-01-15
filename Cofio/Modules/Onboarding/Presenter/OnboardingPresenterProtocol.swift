//
//  OnboardingPresenterProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

protocol OnboardingPresenterInput: AnyObject {}

protocol OnboardingPresenterOutput: AnyObject {
    
    func moduleWantsToClose(_ module: OnboardingPresenterInput)
}
