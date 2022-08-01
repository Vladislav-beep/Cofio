//
//  GradientView.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class GradientView: UIView {
    
    private var progress: Int
    private let gardientlayer = CAGradientLayer()
    
    init(progress: Int) {
        self.progress = progress
        super.init(frame: .zero)
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
        gardientlayer.colors = [UIColor.violet.cgColor, UIColor.base.cgColor]
        gardientlayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gardientlayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gardientlayer.locations = [ 0.0, 1.0]
    }
}
