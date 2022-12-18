//
//  UIViewController+Extension.swift
//  Cofio
//
//  Created by Владислав Сизонов on 18.12.2022.
//

import UIKit

extension UIViewController {
    
    func showTwoButtonAlert(title: String,
                            message: String,
                            actionTitle: String,
                            textFieldPlaceholder: String,
                            completion: @escaping (String) -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = textFieldPlaceholder
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
        present(alert, animated: true)
    }
}
