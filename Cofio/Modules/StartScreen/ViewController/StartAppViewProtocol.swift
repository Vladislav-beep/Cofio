//
//  LanguagesViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol StartAppViewInput: AnyObject {
    
    func updateView()
}

protocol StartAppViewOutput: AnyObject {
    
    func addNewLanguage()
    func viewDidTapRow(_ type: Language)
}
