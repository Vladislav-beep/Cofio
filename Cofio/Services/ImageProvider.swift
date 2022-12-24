//
//  ImageProvider.swift
//  Cofio
//
//  Created by Владислав Сизонов on 28.07.2022.
//

import Foundation
import UIKit

protocol ImageProviderProtocol {
    func getIcons() -> [String]
}

final class ImageProvider: ImageProviderProtocol {
    
    private let icons = [
        "book",
        "calendar nude",
        "calendar",
        "class room",
        "clock",
        "cloud",
        "flower",
        "food",
        "heart",
        "home",
        "life",
        "mail",
        "math",
        "message",
        "photos",
        "pig coin",
        "strava",
        "three gears",
        "train",
        "two gears",
        "weight",
        "shoe",
        "bulb"
    ]

    func getIcons() -> [String] {
        icons
    }
}
