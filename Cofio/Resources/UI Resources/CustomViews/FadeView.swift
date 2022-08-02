//
//  FadeView.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class FadeView: UIView {
    
    private let gardientlayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gardientlayer.frame = bounds
    }
    
    private func setupGradient() {
        layer.addSublayer(gardientlayer)
        gardientlayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gardientlayer.locations = [0, 0.4]
    }
}
