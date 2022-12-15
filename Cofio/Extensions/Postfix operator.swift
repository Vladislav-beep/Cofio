//
//  Postfix operator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.12.2022.
//

import Foundation

postfix operator ~
postfix func ~ (string: String) -> String {
    return NSLocalizedString(string, comment: "")
}
