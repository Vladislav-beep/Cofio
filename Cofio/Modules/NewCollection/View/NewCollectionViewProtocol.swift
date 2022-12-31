//
//  NewCollectionViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

protocol NewCollectionViewInput: AnyObject {
    
    func updateTitleAndButton(title: String, buttonTitle: String)
    func updateTextViewAndIcon(text: String, icon: String)
    func refreshImageView(icon: String)
}

protocol NewCollectionViewOutput: AnyObject {
    
    func moduleDidLoad()
    func viewDidTapButton(name: String)
    func chooseIcon()
    func closeModule()
}
