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
    func showToast(message: String, icon: String)
}

final class NotificationService: NotificationServiceProtocol {
    
    // MARK: Private Properties
    
    private var rootViewController: UIViewController {
        UIApplication.shared.windows.first?.rootViewController?.presentedViewController ?? UIViewController()
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
    
    func showToast(message: String, icon: String) {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = .black
        toastLbl.numberOfLines = 0
        toastLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let textSize = toastLbl.intrinsicContentSize
        let toastWidth = UIScreen.main.bounds.width / 9 * 7
        let labelHeight = (textSize.width / toastWidth) * 50
        let adjustedHeight = max(labelHeight, 60)
        
        let backView = UIView()
        backView.backgroundColor = .base
        backView.layer.cornerRadius = 30
        backView.layer.shadowRadius = 4
        backView.layer.shadowOpacity = 0.4
        backView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        window.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor, constant: 20),
            backView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: toastWidth),
            backView.heightAnchor.constraint(equalToConstant: adjustedHeight)
        ])
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: icon)
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        backView.addSubview(toastLbl)
        NSLayoutConstraint.activate([
            toastLbl.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            toastLbl.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4),
            toastLbl.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
        ])
        
        UIView.animate(withDuration: 3.0, animations: {
            backView.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
    }
}
