//
//  NotificationService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 23.01.2023.
//

import UIKit

protocol NotificationServiceProtocol {
    
    func showTwoButtonAndTextFieldAlert(title: String,
                            message: String,
                            actionTitle: String,
                            textFieldPlaceholder: String?,
                            textFieldText: String?,
                            completion: @escaping (String) -> Void)
    func showTwoButtonAlert(title: String,
                            message: String,
                            actionTitle: String,
                            completion: @escaping () -> Void)
    func showOneButtonAlert(title: String,
                            message: String,
                            actionTitle: String,
                            completion: (() -> Void)?)
}

final class NotificationService: NotificationServiceProtocol {
    
    // MARK: Private Properties
    
    private var rootViewController: UIViewController { UIApplication.shared.keyWindow?.rootViewController?.presentedViewController ?? UIViewController()
    }
    
    // MARK: Public
    
    func showTwoButtonAndTextFieldAlert(title: String,
                            message: String,
                            actionTitle: String,
                            textFieldPlaceholder: String?,
                            textFieldText: String?,
                            completion: @escaping (String) -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = textFieldPlaceholder
            textField.text = textFieldText
        }
        let addAction = UIAlertAction(
            title: actionTitle,
            style: .cancel
        ) { _ in
            let tf = alert.textFields?.first
            let name = tf?.text ?? ""
           completion(name)
        }
        let cancelAction = UIAlertAction(
            title: "theme_module_alert_cancel_button"~,
            style: .default
        )
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        rootViewController.present(alert, animated: true)
    }
    
    func showTwoButtonAlert(title: String,
                            message: String,
                            actionTitle: String,
                            completion: @escaping () -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: actionTitle,
            style: .cancel) { _ in
                completion()
            }
        let cancelAction = UIAlertAction(
            title: "theme_module_alert_cancel_button"~,
            style: .default
        )
        alert.addAction(action)
        alert.addAction(cancelAction)
        rootViewController.present(alert, animated: true)
    }
    
    func showOneButtonAlert(title: String,
                            message: String,
                            actionTitle: String,
                            completion: (() -> Void)?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: actionTitle,
            style: .cancel) { _ in
                completion?()
            }
        alert.addAction(action)
        rootViewController.present(alert, animated: true)
    }
}
