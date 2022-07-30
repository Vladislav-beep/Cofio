//
//  TabBarPresenter.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

final class TabBarPresenter {
    
    weak var view: TabBarViewInput?
    weak var output: TabBarModuleOutput?
    
    private func configureTab() {
        output?.moduleWantsToAddTab(self)
    }
}

extension TabBarPresenter: TabBarModuleInput {}

extension TabBarPresenter: TabBarViewOutput {
    
    func viewDidLoad() {
        configureTab()
    }
}
