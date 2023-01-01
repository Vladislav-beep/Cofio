//
//  NewCardViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

protocol NewCardViewInput: AnyObject {
    
    func updateData(definition: String, description: String)
    func updateButtonTitle(title: String)
}

protocol NewCardViewOutput: AnyObject {
    
    func viewDidLoad()
    func closeModule()
    func didTapButton(definition: String, description: String)
}
