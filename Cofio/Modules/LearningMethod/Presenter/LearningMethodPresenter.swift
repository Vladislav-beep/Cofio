//
//  LearningMethodPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 12.01.2023.
//

import UIKit

final class LearningMethodPresenter {
    
    // MARK: Private properties
    
    private let userDefaultsService: UserDefaultsServiceProtocol
    private let learningMethodDataFactory: LearningMethodDataFactoryProtocol
    
    // MARK: Public properties
    
    weak var view: LearningMethodViewInput?
    
    // MARK: Lifecycle
    
    init(
        userDefaultsService: UserDefaultsServiceProtocol,
        learningMethodDataFactory: LearningMethodDataFactoryProtocol) {
        self.userDefaultsService = userDefaultsService
            self.learningMethodDataFactory = learningMethodDataFactory
    }
    
    // MARK: Private
    
    private func updateView() {
        let repetitionType = userDefaultsService.getRepetitionType()
        let data = learningMethodDataFactory.learningMethodData(repetitionType: repetitionType)

        view?.updateData(with: data)
    }
}

// MARK: - LearningMethodViewOutput

extension LearningMethodPresenter: LearningMethodViewOutput {
    
    func viewDidLoad() {
        updateView()
    }
    
    func viewDidTapLongCell() {
        userDefaultsService.save(repetitionType: .long)
        updateView()
    }
    
    func viewDidTapWeekCell() {
        userDefaultsService.save(repetitionType: .week)
        updateView()
    }
}
