//
//  RepetitionViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

protocol RepetitionViewInput: AnyObject {
    
    func updateData(with data: [RepetitionCellsDataModel])
}

protocol RepetitionViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidTapRow(_ item: RepetitionCellsDataModel)
}
