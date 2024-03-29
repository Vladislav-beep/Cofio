//
//  TabbarFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import UIKit

class TabbarFlowCoordinator: NSObject {
    
    // MARK: Private properties
    
    private let parentViewController: UIViewController
    private let tabBarController: UITabBarController
    private let assembly: ApplicationAssembly
    private let userDefaultsService = UserDefaultsService()
    private var childCoordinators: [FlowCoordinatorProtocol] = []
    
    private weak var mainInput: MainFlowCoordinatorInput?
    
    // MARK: Lifecycle
    
    required init(
        parentViewController: UIViewController,
        assembly: ApplicationAssembly
    ) {
        self.parentViewController = parentViewController
        self.assembly = assembly
        self.tabBarController = .init()
    }
    
    // MARK: Private
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .base
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let parentNavigationController = UINavigationController()
        parentNavigationController.setNavigationBarHidden(false, animated: false)
        
        parentNavigationController.tabBarItem = UITabBarItem.init(
            title: page.pageTitleValue(),
            image: nil,
            tag: page.pageOrderNumber()
        )
        
        switch page {
        case .main:
            let flow = MainFlowCoordinator(
                output: self,
                parentViewController: parentNavigationController,
                assembly: assembly
            )
            childCoordinators.append(flow)
            flow.start()
            
        case .repetition:
            let flow = RepetitionFlowCoordinator(
                output: self,
                parentViewController: parentNavigationController,
                assembly: assembly
            )
            childCoordinators.append(flow)
            flow.start()
            
        case .settings:
            let flow = SettingsFlowCoordinator(
                parentViewController: parentNavigationController,
                assembly: assembly
            )
            childCoordinators.append(flow)
            flow.start()
            
        case .statistics:
            // TODO: добавить флоу координаторы
            let statistics = StatisticsViewController()
            parentNavigationController.pushViewController(statistics, animated: true)
        }
        
        return parentNavigationController
    }
    
    private func openTab(page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - FlowCoordinatorProtocol

extension TabbarFlowCoordinator: FlowCoordinatorProtocol {
    
    func start() {
        let pages: [TabBarPage] = [.main, .repetition, .statistics, .settings]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        let controllers: [UIViewController] = pages.map({ getTabController($0) })
        
        // FIXME: убрать force unwrapp
        prepareTabBarController(withTabControllers: controllers)
        
        let tabBarItem0 = (tabBarController.tabBar.items?[0])! as UITabBarItem
        tabBarItem0.image = UIImage(named: "tab0")
        tabBarItem0.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: 9, right: 0)
        
        let tabBarItem1 = (tabBarController.tabBar.items?[1])! as UITabBarItem
        tabBarItem1.image = UIImage(named: "tab1")
        tabBarItem1.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        let tabBarItem2 = (tabBarController.tabBar.items?[2])! as UITabBarItem
        tabBarItem2.image = UIImage(named: "tab2")
        
        let tabBarItem3 = (tabBarController.tabBar.items?[3])! as UITabBarItem
        tabBarItem3.image = UIImage(named: "tab3")
        tabBarItem3.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        
        tabBarController.modalPresentationStyle = .fullScreen
        parentViewController.present(tabBarController, animated: false)
    }
    
    func finish(completion: (() -> Void)?) {
        // TODO: finish child flowcoordinators if switch to login controller
    }
}

// MARK: - UITabBarControllerDelegate

extension TabbarFlowCoordinator: UITabBarControllerDelegate {
    
    // FIXME: добавить имплементацию либо удалить
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}

// MARK: - MainFlowCoordinatorOutput

extension TabbarFlowCoordinator: MainFlowCoordinatorOutput {
    
    func setMainFlowCoordinatorInput(input: MainFlowCoordinatorInput) {
        mainInput = input
    }
    
    func openSettingsTab() {
        openTab(page: .settings)
    }
}

// MARK: - RepetitionFlowCoordinatorOutput

extension TabbarFlowCoordinator: RepetitionFlowCoordinatorOutput {

    func repetitionFlowWantsToUpdateModules() {
        mainInput?.refreshThemesModule()
    }
}
