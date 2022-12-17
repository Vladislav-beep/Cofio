//
//  ThemesViewProtocol.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

protocol ThemesViewInput: AnyObject {
    
    func updateData(with data: [ThemesCellsDataModel])
    func setupNavBarTitle(with title: String)
}

protocol ThemesViewOutput: AnyObject {
    
    func viewDidLoad()
    func viewDidTapRow(_ item: ThemesCellDataModel)
    func addTheme(name: String)
}
