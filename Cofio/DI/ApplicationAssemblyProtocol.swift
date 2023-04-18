//
//  ApplicationAssemblyProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.04.2023.
//

protocol ApplicationAssemblyProtocol {
    
    var servicesAssembly: ServicesAssemblyProtocol { get }
    var uiAssembly: UIAssemblyProtocol { get }
}
