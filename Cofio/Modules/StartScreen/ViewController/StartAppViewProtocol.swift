//
//  LanguagesViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol StartAppViewInput: AnyObject {
    
    func updateView(with data: [StartAppCellViewModel])
}

protocol StartAppViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapRow(_ type: StartAppCellViewModel)
    func addNewLanguage()
}
