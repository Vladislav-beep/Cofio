//
//  ServicesAssemblyProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.04.2023.
//

protocol ServicesAssemblyProtocol {
    
    var repetitionService: RepetitionServiceProtocol { get }
    var coreDataManager: CoreDataManagerProtocol { get }
    var storageService: StorageServiceProtocol { get }
    var userDefaultsService: UserDefaultsServiceProtocol { get }
    var dateFormatterService: DateFormatterServiceProtocol { get }
}
