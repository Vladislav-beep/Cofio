//
//  MainInteractor.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

final class MainInteractor {
    
    // MARK: Properties
    
    weak var output: MainInteractorOutput?
}


// MARK: - StartAppInteractorInput

extension MainInteractor: MainInteractorInput {}
