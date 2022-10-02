//
//  CardsInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

final class CardsInteractor {
    
    // MARK: Properties
    
    weak var output: CardsInteractorOutput?
}


// MARK: - CardsInteractorInput

extension CardsInteractor: CardsInteractorInput {}
