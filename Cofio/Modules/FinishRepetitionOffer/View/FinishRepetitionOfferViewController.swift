//
//  FinishRepetitionOfferViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

import UIKit

final class FinishRepetitionOfferViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: FinishRepetitionOfferViewOutput
    
    private let closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return closeButton
    }()
    
    private let checkMarkImageView: UIImageView = {
        let checkMarkImageView = UIImageView()
        checkMarkImageView.clipsToBounds = true
        checkMarkImageView.translatesAutoresizingMaskIntoConstraints = false
        return checkMarkImageView
    }()
    
    private let titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: Strings.FinishOfferModule.titleLabel)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let themeLabel: UILabel = {
        let themeLabel = UILabel()
        themeLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        themeLabel.numberOfLines = 7
        themeLabel.textAlignment = .center
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        return themeLabel
    }()
    
    private let repeatLabel: UILabel = {
        let repeatLabel = UILabel()
        repeatLabel.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        repeatLabel.numberOfLines = 0
        repeatLabel.textAlignment = .center
        repeatLabel.text = Strings.FinishOfferModule.repeated
        repeatLabel.translatesAutoresizingMaskIntoConstraints = false
        return repeatLabel
    }()
    
    private let nextRepeatLabel: UILabel = {
        let nextRepeatLabel = UILabel()
        nextRepeatLabel.font = UIFont.systemFont(ofSize: 21, weight: .regular)
        nextRepeatLabel.numberOfLines = 0
        nextRepeatLabel.textAlignment = .center
        nextRepeatLabel.text = Strings.FinishOfferModule.nextRepeat
        nextRepeatLabel.translatesAutoresizingMaskIntoConstraints = false
        return nextRepeatLabel
    }()
    
    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        dateLabel.numberOfLines = 0
        dateLabel.textAlignment = .center
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    private let doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle(Strings.FinishOfferModule.buttonTitle, for: .normal)
        doneButton.backgroundColor = .darkViolet
        doneButton.layer.cornerRadius = 15
        doneButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return doneButton
    }()
    
    // MARK: Lifecycle
    
    init(output: FinishRepetitionOfferViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(checkMarkImageView)
        checkMarkImageView.layer.cornerRadius = UIScreen.main.bounds.height / 8
        NSLayoutConstraint.activate([
            checkMarkImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            checkMarkImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            checkMarkImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkMarkImageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 40)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: checkMarkImageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(themeLabel)
        NSLayoutConstraint.activate([
            themeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            themeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            themeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(repeatLabel)
        NSLayoutConstraint.activate([
            repeatLabel.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 18),
            repeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            repeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(nextRepeatLabel)
        NSLayoutConstraint.activate([
            nextRepeatLabel.topAnchor.constraint(equalTo: repeatLabel.bottomAnchor, constant: 35),
            nextRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nextRepeatLabel.bottomAnchor, constant: 14),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.heightAnchor.constraint(equalToConstant: 56),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    // MARK: Actions
    
    @objc func didTapButton() {
        output.close()
    }
}

// MARK: - FinishRepetitionOfferViewInput

extension FinishRepetitionOfferViewController: FinishRepetitionOfferViewInput {
    // TODO: сделать посередине вью
    func updateData(with data: FinishRepetitionOfferModel) {
        themeLabel.text = data.themeName
        dateLabel.text = data.date
        checkMarkImageView.image = UIImage(named: "repeated")
        
        if data.isCompleted {
            repeatLabel.text = Strings.FinishOfferModule.learned
            checkMarkImageView.image = UIImage(named: "check")
            dateLabel.isHidden = true
            nextRepeatLabel.isHidden = true
        }
    }
}
