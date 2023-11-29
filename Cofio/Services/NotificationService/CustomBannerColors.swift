//
//  CustomBannerColors.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.11.2023.
//

import NotificationBannerSwift

class CustomBannerColors: BannerColorsProtocol {

    internal func color(for style: BannerStyle) -> UIColor {
        switch style {
        case .danger: return .paleRed
        case .info: return .paleBlue
        case .customView: return .paleGreen
        case .success: return .paleGreen
        case .warning: return .paleYellow
        }
    }
}
