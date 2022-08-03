//
//  NewLanguageViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewLanguageViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: NewLanguageViewOutput
    private let imageProvider: ImageProviderProtocol
    
    private lazy var closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
    private let titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: AppText.NewLanguage.title.rawValue)
        return titleLabel
    }()
    
    private let languageTextField: LanguageTextField = {
        let languageTextField = LanguageTextField()
        return languageTextField
    }()
    
    private let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.backgroundColor = .lightOrange
        pickerView.layer.cornerRadius = 20
        return pickerView
    }()
    
    private lazy var doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle(AppText.NewLanguage.buttonTitle.rawValue, for: .normal)
        doneButton.backgroundColor = .darkViolet
        doneButton.layer.cornerRadius = 15
        doneButton.addTarget(self, action: #selector(addLanguage), for: .touchUpInside)
        return doneButton
    }()
    
    private lazy var languages = imageProvider.getPickerModels()
    
    
    // MARK: Lifecycle
    
    init(output: NewLanguageViewOutput, imageProvider: ImageProviderProtocol) {
        self.output = output
        self.imageProvider = imageProvider
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        pickerView.delegate = self
        pickerView.dataSource = self
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
        
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.heightAnchor.constraint(equalToConstant: 56),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(languageTextField)
        NSLayoutConstraint.activate([
            languageTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            languageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            languageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            languageTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        view.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: languageTextField.bottomAnchor, constant: 24),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    // MARK: Actions
    
    @objc func close() {
        output.closeModule()
    }
    
    @objc func addLanguage() {
    
    }
}


// MARK: - NewLanguageViewInput

extension NewLanguageViewController: NewLanguageViewInput {}


// MARK: - UIPickerViewDataSource

extension NewLanguageViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { 40.0 }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let model = languages[row]
        return LanguagesPickerView.create(icon: model.icon, title: model.title)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languageTextField.text = languages[row].title
    }
}


// MARK: - UIPickerViewDelegate

extension NewLanguageViewController: UIPickerViewDelegate {}
