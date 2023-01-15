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
    let data = [
        OnboardingCellDataModel(image: UIImage(named: "book")!, title: "11111111", subtitle: "ascvassac"),
        OnboardingCellDataModel(image: UIImage(named: "clock")!, title: "222222222", subtitle: "sfffffffffff"),
        OnboardingCellDataModel(image: UIImage(named: "calendar")!, title: "qeklqklkm klmqemkelwklmwe wklem eeetehehet tehhteehthte", subtitle: "wekwekewkp kwdkkwkwkm kmwekmwkmkm mkekm wekweklkew kmwekmewkmekmlwk mmk kmewmkekmwlwkemlekml kmwekmlewklmew mkwekmle wklmkmlewkmew mkw e")
    ]
    
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
            view?.updateMainButtonTitle(title: "Закрыть")
        }
    }
}

// MARK: - OnboardingPresenterInput

extension OnboardingPresenter: OnboardingPresenterInput {}
