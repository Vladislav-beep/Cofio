//
//  CollectionCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class ThemesCell: UITableViewCell {
    
    // MARK: Public data structures
    
    struct DisplayData: Hashable {
        let title: String
        let subtitle: String
        let totalRepeats: Int
        let repeats: Int
    }
    
    // MARK: Private properties
    
    private let lowerView: LowerView = {
        let view = LowerView()
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.numberOfLines = 1
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private let progressView: UIView = {
        let progressView = UIView()
        progressView.backgroundColor = .clear
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        return progressLabel
    }()
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    
    private func setupViews() {
        contentView.addSubview(lowerView)
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            lowerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lowerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        
        lowerView.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.centerYAnchor.constraint(equalTo: lowerView.centerYAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 50),
            progressView.heightAnchor.constraint(equalToConstant: 50),
            progressView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -16)
        ])
        
        progressView.addSubview(progressLabel)
        NSLayoutConstraint.activate([
            progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            progressLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        ])
        
        lowerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: -12),
        ])
        
        lowerView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
            subtitleLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupLayers(displayData: DisplayData) {
        // TODO: иногда не срабатывает анимация при обновлении экрана
        let shapeLayer = CAShapeLayer()
        let trackLayer = CAShapeLayer()
        
        let x = progressView.center.x + 25
        let y = progressView.center.y + 25
        let center = CGPoint(x: x, y: y)
        let circularPath = UIBezierPath(arcCenter: .zero,
                                        radius: 25,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 5
        trackLayer.position = center
        
        progressView.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.darkViolet.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeEnd = 0
        shapeLayer.position = center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        progressView.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        let toValue = Double(displayData.repeats)/Double(displayData.totalRepeats)
        basicAnimation.toValue = toValue
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "circleAnimation")
    }
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        subtitleLabel.text = displayData.subtitle
        progressLabel.text = "\(displayData.repeats)/\(displayData.totalRepeats)"
        setupLayers(displayData: displayData)
    }
}
