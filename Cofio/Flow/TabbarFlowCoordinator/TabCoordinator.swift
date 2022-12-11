//
//  TabCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabbarFlowCoordinator: NSObject, Coordinator, RepetitionPresenterOutput {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.main, .repetition, .settings, .analytics]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
        
        navigationController.tabBarController?.tabBar.backgroundColor = .systemTeal
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())

        switch page {
        case .main:
            // If needed: Each tab bar flow can have it's own Coordinator.
            let flow = FlowCoordinator1(vc: navController)
            flow.start()
//            let readyVC = ReadyViewController()
//            readyVC.didSendEventClosure = { [weak self] event in
//                switch event {
//                case .ready:
//                    self?.selectPage(.steady)
//                }
         //   }
                        
           // navController.pushViewController(readyVC, animated: true)
        case .repetition:
//            let steadyVC = SteadyViewController()
//            steadyVC.didSendEventClosure = { [weak self] event in
//                switch event {
//                case .steady:
//                    self?.selectPage(.go)
//                }
//            }
            let builder = RepetitionModuleBuilder(output: self)
            let vc = builder.build()
            
            navController.pushViewController(vc, animated: true)
        case .settings:
            let settingVC = SettingsViewController()
            
            navController.pushViewController(settingVC, animated: true)
        case .analytics:
            let statistics = StatisticsViewController()
            navController.pushViewController(statistics, animated: true)
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
