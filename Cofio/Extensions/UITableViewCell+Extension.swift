//
//  UITableViewCell+Extension.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.07.2022.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}
