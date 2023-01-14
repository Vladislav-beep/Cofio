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
    
    // MARK: Public properties
    
    weak var view: LearningMethodViewInput?
    
    // MARK: Lifecycle
    
    init(userDefaultsService: UserDefaultsServiceProtocol) {
        self.userDefaultsService = userDefaultsService
    }
    
    private func updateView() {
        let longColor: UIColor
        let weekColor: UIColor
        
        if userDefaultsService.getRepetitionType() == .long {
            longColor = .lightGreen
            weekColor = .base
        } else {
            longColor = .base
            weekColor = .lightGreen
        }
        
        let data: [LearningCellsDataModel] = [
            .long(.init(
                title: "learning_method_module_long_cell_title"~,
                subtitle: "learning_method_module_long_cell_subtitle"~,
                backGroundColor: longColor)
            ),
            .week(.init(
                title: "learning_method_module_week_cell_title"~,
                subtitle: "learning_method_module_week_cell_subtitle"~,
                backGroundColor: weekColor)
            )
        ]
        print("\(userDefaultsService.getRepetitionType())")
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
