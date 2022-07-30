//
//  TabBarViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    var output: TabBarViewOutput?
    
    init(output: TabBarViewOutput?) {
        super.init(nibName: nil, bundle: nil)
        self.output = output
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        output?.viewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        tabBar.backgroundColor = .base
        
        delegate = self
    }
}

extension TabBarViewController: TabBarViewInput {}

extension TabBarViewController: UITabBarControllerDelegate {}
