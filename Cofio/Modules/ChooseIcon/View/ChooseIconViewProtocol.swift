//
//  ChooseIconViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

import Foundation

protocol ChooseIconViewInput: AnyObject {}

protocol ChooseIconViewOutput: AnyObject {
    
    func getIcons() -> [String]
    func viewDidTapRow(icon: String)
}
