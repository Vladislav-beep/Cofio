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
    func showToast(message: String)
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
    
//    func showToast(message: String) {
//        guard let window = UIApplication.shared.keyWindow else {
//            return
//        }
//
//        let toastLbl = UILabel()
//        toastLbl.text = message
//        toastLbl.textAlignment = .center
//        toastLbl.font = UIFont.systemFont(ofSize: 18)
//        toastLbl.textColor = UIColor.white
//        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        toastLbl.numberOfLines = 0
//
//
//        let textSize = toastLbl.intrinsicContentSize
//        let labelHeight = ( textSize.width / window.frame.width ) * 30
//        let labelWidth = min(textSize.width, window.frame.width - 40)
//        let adjustedHeight = max(labelHeight, textSize.height + 20)
//
//        toastLbl.frame = CGRect(x: 20, y: 90 - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
//        toastLbl.center.x = window.center.x
//        toastLbl.layer.cornerRadius = 10
//        toastLbl.layer.masksToBounds = true
//
//        window.addSubview(toastLbl)
//
//        UIView.animate(withDuration: 3.0, animations: {
//            toastLbl.alpha = 0
//        }) { (_) in
//            toastLbl.removeFromSuperview()
//        }
//    }
    
    func showToast(message: String) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let toastLbl = UILabel()
        toastLbl.translatesAutoresizingMaskIntoConstraints = false
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = UIColor.red
       // toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLbl.numberOfLines = 0
        
        
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / window.frame.width ) * 30
        print(" vllabelHeightad\(labelHeight)")
        print("height\(textSize.height)")
        print("width\(textSize.width)")
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let adjustedHeight = max(labelHeight, textSize.height + 20)
        print("adjustedHeight\(adjustedHeight)")
        
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 30
        window.addSubview(backView)
        backView.backgroundColor = .base
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor, constant: 20),
            backView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 * 2),
            backView.heightAnchor.constraint(equalToConstant: adjustedHeight)
        ])
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "calendar")
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        backView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        
//        let toastLbl = UILabel()
//        toastLbl.translatesAutoresizingMaskIntoConstraints = false
//        toastLbl.text = message
//        toastLbl.textAlignment = .center
//        toastLbl.font = UIFont.systemFont(ofSize: 18)
//        toastLbl.textColor = UIColor.red
//       // toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        toastLbl.numberOfLines = 0
//
//
//        let textSize = toastLbl.intrinsicContentSize
//        let labelHeight = ( textSize.width / window.frame.width ) * 30
//        let labelWidth = min(textSize.width, window.frame.width - 40)
//        let adjustedHeight = max(labelHeight, textSize.height + 20)
        
        backView.addSubview(toastLbl)
        NSLayoutConstraint.activate([
            toastLbl.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            toastLbl.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            toastLbl.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
        ])
        
//        toastLbl.frame = CGRect(x: 20, y: 90 - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
//        toastLbl.center.x = window.center.x
//        toastLbl.layer.cornerRadius = 10
//        toastLbl.layer.masksToBounds = true
        
       // window.addSubview(backView)
        
        UIView.animate(withDuration: 3.0, animations: {
            backView.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
    }
}
