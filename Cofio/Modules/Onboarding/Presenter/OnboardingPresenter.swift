//
//  OnboardingPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

import UIKit

final class OnboardingPresenter {
    
    // MARK: Private properties
    
    private let onboardingService: OnboardingServiceProtocol
    private var isLastPage: Bool = false
    
    private var data: [OnboardingCellDataModel] {
        onboardingService.getOnboardingData()
    }
    
    // MARK: Public properties
    
    weak var view: OnboardingViewInput?
    weak var output: OnboardingPresenterOutput?
    
    // MARK: Lifecycle
    
    init(onboardingService: OnboardingServiceProtocol) {
        self.onboardingService = onboardingService
    }
}

// MARK: - OnboardingViewOutput

extension OnboardingPresenter: OnboardingViewOutput {
    
    func viewDidLoad() {
        view?.updateData(with: data)
    }
    
    func getPagesCount() -> Int {
        data.count
    }
    
    func viewDidTapButton(indexPath: IndexPath) {
        if isLastPage {
            output?.moduleWantsToClose(self)
        }
        
        if indexPath.row == data.count - 1 {
            isLastPage = true
            view?.updateMainButtonTitle(title: Strings.Common.CloseButton.title)
        }
    }
}

// MARK: - OnboardingPresenterInput

extension OnboardingPresenter: OnboardingPresenterInput {}
