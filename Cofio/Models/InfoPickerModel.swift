//
//  InfoPickerModel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 28.07.2022.
//

import UIKit

struct InfoPickerModel: Comparable {
    let title: String
    let icon: UIImage
    
    static func < (lhs: InfoPickerModel, rhs: InfoPickerModel) -> Bool {
        lhs.title < rhs.title
    }
}
