//
//  TabBarModuleProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

protocol TabBarModuleInput: AnyObject {}

protocol TabBarModuleOutput: AnyObject {
    
    func moduleWantsToAddTab(_ module: TabBarModuleInput)
}
