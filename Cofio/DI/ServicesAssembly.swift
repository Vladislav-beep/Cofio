//
//  ServicesAssembly.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.04.2023.
//

final class ServicesAssembly: ServicesAssemblyProtocol {
    
    var repetitionService: RepetitionServiceProtocol {
        RepetitionService()
    }
    
    var coreDataManager: CoreDataManagerProtocol {
        CoreDataManager()
    }
    
    var storageService: StorageServiceProtocol {
        StorageService(coreDataManager: coreDataManager)
    }
    
    var userDefaultsService: UserDefaultsServiceProtocol {
        UserDefaultsService()
    }
    
    var dateFormatterService: DateFormatterServiceProtocol {
        DateFormatterService()
    }
}
