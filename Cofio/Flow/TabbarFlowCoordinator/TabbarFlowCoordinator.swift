//
//  TabbarFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import UIKit

protocol TabbarFlowCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabbarFlowCoordinator: NSObject, Coordinator, RepetitionPresenterOutput {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var parentViewController: UIViewController
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        self.tabBarController = .init()
    }

    func start() {
        let pages: [TabBarPage] = [.main, .repetition, .statistics, .settings]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        let controllers: [UIViewController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
 
        tabBarController.modalPresentationStyle = .fullScreen
        parentViewController.present(tabBarController, animated: false)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .gray
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())

        switch page {
        case .main:
            let flow = FlowCoordinator1(vc: navController)
            flow.start()
                        
        case .repetition:
            let builder = RepetitionModuleBuilder(output: self)
            let vc = builder.build()
            navController.pushViewController(vc, animated: true)
        
        case .settings:
            let statistics = StatisticsViewController()
            navController.pushViewController(statistics, animated: true)
            
        case .statistics:
            let settingVC = SettingsViewController()
            navController.pushViewController(settingVC, animated: true)
        }
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabbarFlowCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
