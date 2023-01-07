//
//  AppDelegate.swift
//  Cofio
//
//  Created by Владислав Сизонов on 19.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let repetition: RepetitionType = .long
       // UserDefaults.standard.set(repetition, forKey: "repetitionType")
        
        if let encoded = try? JSONEncoder().encode(repetition) {
            UserDefaults.standard.set(encoded, forKey: "repetitionType")
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
