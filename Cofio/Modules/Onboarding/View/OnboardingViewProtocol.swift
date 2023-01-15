//
//  OnboardingViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

import UIKit

protocol OnboardingViewInput: AnyObject {
    
    func updateData(with data: [OnboardingCellDataModel])
    func updateMainButtonTitle(title: String)
}

protocol OnboardingViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapButton(indexPath: IndexPath)
    func getPagesCount() -> Int
}
