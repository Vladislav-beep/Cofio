//
//  LearningMethodPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 12.01.2023.
//

final class LearningMethodPresenter {
    
    // MARK: Public properties
    
    weak var view: LearningMethodViewInput?
}

// MARK: - LearningMethodViewOutput

extension LearningMethodPresenter: LearningMethodViewOutput {
    
    func viewDidLoad() {
        let data: [LearningCellsDataModel] = [
            .long(.init(
                title: "learning_method_module_long_cell_title"~,
                subtitle: "learning_method_module_long_cell_subtitle"~,
                isOn: true)
            ),
            .week(.init(
                title: "learning_method_module_week_cell_title"~,
                subtitle: "learning_method_module_week_cell_subtitle"~,
                isOn: false)
            )
        ]
        
        view?.updateData(with: data)
    }
}
