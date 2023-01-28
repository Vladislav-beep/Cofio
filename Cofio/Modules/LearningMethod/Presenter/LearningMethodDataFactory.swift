//
//  LearningMethodDataFactory.swift
//  Cofio
//
//  Created by Владислав Сизонов on 14.01.2023.
//

import UIKit

protocol LearningMethodDataFactoryProtocol {
    
    func learningMethodData(repetitionType: RepetitionType?) -> [LearningCellsDataModel]
}

final class LearningMethodDataFactory: LearningMethodDataFactoryProtocol {
    
    // MARK: Public
    
    func learningMethodData(repetitionType: RepetitionType?) -> [LearningCellsDataModel] {
        let longColor: UIColor
        let weekColor: UIColor
        
        switch repetitionType {
        case .long:
            longColor = .lightGreen
            weekColor = .base
            
        case .week:
            longColor = .base
            weekColor = .lightGreen
            
        case nil:
            longColor = .base
            weekColor = .base
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
        
        return data
    }
}
