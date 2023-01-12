//
//  LearningMethodViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 11.01.2023.
//

protocol LearningMethodViewInput: AnyObject {
    
    func updateData(with data: [LearningCellsDataModel])
}

protocol LearningMethodViewOutput: AnyObject {
    
    func viewDidLoad()
}
