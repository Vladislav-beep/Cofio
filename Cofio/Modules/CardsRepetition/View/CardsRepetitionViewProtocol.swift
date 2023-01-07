//
//  CardsRepetitionViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import Foundation

protocol CardsRepetitionViewInput: AnyObject {
    
    func updateData(with data: [RepetitionCardCellDataModel])
    func updateNavBarTitle(navBarTitle: String)
}

protocol CardsRepetitionViewOutput: AnyObject {
    
    func viewDidLoad()
    func getCardsCount() -> Int
    func viewDidTapRow(indexPath: IndexPath)
    func viewDidTapButton(indexPath: IndexPath)
    func viewDidTapMoreTime(indexPath: IndexPath)
}
