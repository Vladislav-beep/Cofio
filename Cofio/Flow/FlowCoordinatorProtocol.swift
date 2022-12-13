//
//  FlowCoordinatorProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 13.12.2022.
//

protocol FlowCoordinatorProtocol: AnyObject {
    func start()
    func finish(completion: (() -> Void)?)
}
