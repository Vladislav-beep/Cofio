//
//  ApplicationAssembly.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.04.2023.
//

import Foundation

final class ApplicationAssembly: ApplicationAssemblyProtocol {
    
    var servicesAssembly: ServicesAssemblyProtocol {
        ServicesAssembly()
    }
    
    var uiAssembly: UIAssemblyProtocol {
        UIAssembly()
    }
}
