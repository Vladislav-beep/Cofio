//
//  NotificationService.swift
//  Cofio
//
//  Created by Владислав Сизонов on 23.01.2023.
//

import NotificationBannerSwift
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
    func showToast(title: String, message: String, style: BannerStyle, image: String)
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
            title: Strings.Common.CancelButton.title,
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
            title: Strings.Common.CancelButton.title,
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
    
    func showToast(title: String, message: String, style: BannerStyle, image: String) {
        let image = UIImage(named: image)
        let banner = FloatingNotificationBanner(
            title: title,
            subtitle: message,
            titleColor: .black,
            subtitleColor: .black,
            leftView: UIImageView.init(image: image),
            style: style,
            colors: CustomBannerColors()
        )

        banner.show(
            queuePosition: .front,
            bannerPosition: .top,
            edgeInsets: UIEdgeInsets(top: 20, left: 16, bottom: 8, right: 16),
            cornerRadius: 20,
            shadowBlurRadius: 5
        )
    }
}
