//
//  TabbarFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import UIKit

class TabbarFlowCoordinator: NSObject, FlowCoordinatorProtocol {
    
    var childCoordinators: [FlowCoordinatorProtocol] = []
    var parentViewController: UIViewController
    var tabBarController: UITabBarController

    
    required init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        self.tabBarController = .init()
    }

    func start() {
        let pages: [TabBarPage] = [.main, .repetition, .statistics, .settings]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        let controllers: [UIViewController] = pages.map({ getTabController($0) })
        
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
        // TODO: to do
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
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

        parentNavigationController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())

        switch page {
        case .main:
            let flow = MainFlowCoordinator(parentViewController: parentNavigationController)
            flow.start()
                        
        case .repetition:
            let flow = RepetitionFlowCoordinator(parentViewController: parentNavigationController)
            flow.start()
        
        case .settings:
            let statistics = StatisticsViewController()
            parentNavigationController.pushViewController(statistics, animated: true)
            
        case .statistics:
            let settingVC = SettingsViewController()
            parentNavigationController.pushViewController(settingVC, animated: true)
        }
        return parentNavigationController
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
